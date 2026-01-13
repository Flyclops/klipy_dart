import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:klipy_dart/src/constants/constants.dart';
import 'package:klipy_dart/src/models/models.dart';
import 'package:klipy_dart/src/http_client.dart';

part 'response.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable(explicitToJson: true)
class KlipyResponse {
  static const _encoder = JsonEncoder.withIndent('  ');

  @JsonKey(name: 'results')
  final List<KlipyResultsObject> results;

  @JsonKey(name: 'aspect_ratio_range')
  final TenorAspectRatioRange aspectRatioRange;

  @JsonKey(name: 'endpoint')
  final TenorEndpoint? endpoint;

  @JsonKey(name: 'media_filter')
  final List<String>? mediaFilter;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'parameters')
  final String? parameters;

  @JsonKey(name: 'timeout')
  final Duration timeout;

  KlipyResponse({
    required this.results,
    this.aspectRatioRange = TenorAspectRatioRange.all,
    this.endpoint,
    this.mediaFilter = const [KlipyMediaFormat.tinyGif],
    this.next,
    this.parameters,
    this.timeout = const Duration(seconds: 5),
  });

  factory KlipyResponse.fromJson(Map<String, dynamic> json) =>
      _$KlipyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyResponseToJson(this);

  // TODO look into sticker and random on fetchNext
  Future<KlipyResponse?> fetchNext({
    int limit = 1,
    KlipyHttpClient httpClient = const KlipyHttpClient(),
  }) {
    return httpClient.getGifs(
      endpoint!,
      timeout,
      parameters!,
      aspectRatioRange: aspectRatioRange,
      limit: limit,
      mediaFilter: mediaFilter,
      pos: next,
    );
  }

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
