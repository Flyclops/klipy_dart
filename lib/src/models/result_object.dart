import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:klipy_dart/src/models/media_formats.dart';

part 'result_object.g.dart';

/// Based on [response object](https://docs.klipy.com/migrate-from-tenor/response-objects/response-object) from the Klipy API.
@JsonSerializable(explicitToJson: true)
class KlipyResultObject {
  static const _encoder = JsonEncoder.withIndent('  ');

  /// A Unix timestamp that represents when this post was created.
  @JsonKey(name: 'created')
  final double created;

  /// eturns `true` if this post contains audio.
  @JsonKey(name: 'hasaudio', defaultValue: false)
  final bool hasAudio;

  /// KLIPY result identifier.
  @JsonKey(name: 'id')
  final String id;

  /// A dictionary with a [content format](https://docs.klipy.com/migrate-from-tenor/response-objects/content-formats) as the key and a [Media Object](https://docs.klipy.com/migrate-from-tenor/response-objects/media-object) as the value.
  @JsonKey(name: 'media_formats')
  final KlipyMediaFormats media;

  /// An array of tags for the post.
  @JsonKey(name: 'tags', defaultValue: [])
  final List<String> tags;

  /// The title of the post.
  @JsonKey(name: 'title')
  final String title;

  /// A textual description of the content.
  @JsonKey(name: 'content_description')
  final String contentDescription;

  /// The full URL to view the post on [Klipy.com](https://klipy.com/).
  @JsonKey(name: 'itemurl')
  final String itemUrl;

  /// Returns `true` if this post contains captions.
  @JsonKey(name: 'hascaption', defaultValue: false)
  final bool hasCaption;

  /// Comma-separated list to signify whether the content is a sticker or static image, has audio, or is any combination of these. If `sticker` and `static` aren't present, then the content is a GIF. A blank `flags` field signifies a GIF without audio.
  @JsonKey(name: 'flags', defaultValue: [])
  final List<String> flags;

  /// The most common background pixel color of the content.
  @JsonKey(name: 'bg_color')
  final String? bgColor;

  /// A short URL to view the post on [Klipy.com](https://klipy.com/).
  @JsonKey(name: 'url')
  final String url;

  /// Analytical value to track the source of where this GIF came from. For instance which Tab in a UI.
  @JsonKey(name: 'source')
  final String? source;

  KlipyResultObject({
    required this.contentDescription,
    required this.created,
    required this.flags,
    required this.hasAudio,
    required this.hasCaption,
    required this.id,
    required this.itemUrl,
    required this.tags,
    required this.title,
    required this.url,
    this.bgColor,
    this.media = const KlipyMediaFormats(),
    this.source,
  });

  factory KlipyResultObject.fromJson(Map<String, dynamic> json) =>
      _$KlipyResultObjectFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyResultObjectToJson(this);

  KlipyResultObject copyWith({
    double? created,
    bool? hasAudio,
    String? id,
    KlipyMediaFormats? media,
    List<String>? tags,
    String? title,
    String? contentDescription,
    String? itemUrl,
    bool? hasCaption,
    List<String>? flags,
    String? bgColor,
    String? url,
    String? source,
  }) {
    return KlipyResultObject(
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
      source: source ?? this.source,
    );
  }

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
