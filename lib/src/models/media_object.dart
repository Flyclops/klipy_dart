import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:klipy_dart/src/models/media_object_dimensions.dart';

part 'media_object.g.dart';

/// Based on [media object](https://docs.klipy.com/migrate-from-tenor/response-objects/media-object) from the Klipy API.
@JsonSerializable(explicitToJson: true)
class KlipyMediaObject {
  static const _encoder = JsonEncoder.withIndent('  ');

  /// A URL to the media source
  @JsonKey(name: 'url')
  final String url;

  /// Width _(first)_ and height _(last)_ of the media in pixels
  @JsonKey(name: 'dims', fromJson: dimensionsfromJson, toJson: dimensionsToJson)
  final KlipyMediaObjectDimensions dimensions;

  /// Represents the time in seconds for one loop of the content. If the content is static, the duration is set to `0`.
  @JsonKey(name: 'duration', defaultValue: 0)
  final double duration;

  /// Size of the file in bytes
  @JsonKey(name: 'size')
  final int size;

  KlipyMediaObject({
    required this.url,
    required this.dimensions,
    required this.duration,
    required this.size,
  });

  factory KlipyMediaObject.fromJson(Map<String, dynamic> json) =>
      _$KlipyMediaObjectFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyMediaObjectToJson(this);

  static KlipyMediaObjectDimensions dimensionsfromJson(
    List<dynamic> dimensions,
  ) {
    return KlipyMediaObjectDimensions.fromJson({'dims': dimensions});
  }

  static List<dynamic> dimensionsToJson(KlipyMediaObjectDimensions dimensions) {
    return [dimensions.width, dimensions.height];
  }

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
