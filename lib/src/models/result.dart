import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tenor_dart/src/models/media_formats.dart';

part 'result.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable(explicitToJson: true)
class TenorResult {
  static const _encoder = JsonEncoder.withIndent('  ');

  /// A Unix timestamp that represents when this post was created.
  @JsonKey(name: 'created')
  final double created;

  /// eturns true if this post contains audio.
  @JsonKey(name: 'hasaudio', defaultValue: false)
  final bool hasAudio;

  /// Tenor result identifier
  @JsonKey(name: 'id')
  final String id;

  /// A dictionary with a [content format](https://developers.google.com/tenor/guides/response-objects-and-errors#content-formats) as the key and a [Media Object](https://developers.google.com/tenor/guides/response-objects-and-errors#media-object) as the value.
  @JsonKey(name: 'media_formats')
  final TenorMediaFormats media;

  /// An array of tags for the post
  @JsonKey(name: 'tags', defaultValue: [])
  final List<String> tags;

  /// The title of the post
  @JsonKey(name: 'title')
  final String title;

  /// A textual description of the content.
  @JsonKey(name: 'content_description')
  final String contentDescription;

  /// The full URL to view the post on [tenor.com](http://tenor.com/).
  @JsonKey(name: 'itemurl')
  final String itemUrl;

  /// Returns true if this post contains captions.
  @JsonKey(name: 'hascaption', defaultValue: false)
  final bool hasCaption;

  /// Comma-separated list to signify whether the content is a sticker or static image, has audio, or is any combination of these.
  ///
  /// If sticker and static aren't present, then the content is a GIF. A blank flags field signifies a GIF without audio.
  @JsonKey(name: 'flags', defaultValue: [])
  final List<String> flags;

  /// The most common background pixel color of the content
  @JsonKey(name: 'bg_color')
  final String? bgColor;

  /// A short URL to view the post on [tenor.com](http://tenor.com/).
  @JsonKey(name: 'url')
  final String url;

  TenorResult({
    required this.created,
    required this.hasAudio,
    required this.id,
    this.media = const TenorMediaFormats(),
    required this.tags,
    required this.title,
    required this.contentDescription,
    required this.itemUrl,
    required this.hasCaption,
    required this.flags,
    this.bgColor,
    required this.url,
  });

  factory TenorResult.fromJson(Map<String, dynamic> json) =>
      _$TenorResultFromJson(json);

  Map<String, dynamic> toJson() => _$TenorResultToJson(this);

  TenorResult copyWith({
    double? created,
    bool? hasAudio,
    String? id,
    TenorMediaFormats? media,
    List<String>? tags,
    String? title,
    String? contentDescription,
    String? itemUrl,
    bool? hasCaption,
    List<String>? flags,
    String? bgColor,
    String? url,
  }) {
    return TenorResult(
      created: created ?? this.created,
      hasAudio: hasAudio ?? this.hasAudio,
      id: id ?? this.id,
      media: media ?? this.media,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      contentDescription: contentDescription ?? this.contentDescription,
      itemUrl: itemUrl ?? this.itemUrl,
      hasCaption: hasCaption ?? this.hasCaption,
      flags: flags ?? this.flags,
      bgColor: bgColor ?? this.bgColor,
      url: url ?? this.url,
    );
  }

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
