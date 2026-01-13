import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:klipy_dart/src/constants/media_format.dart';
import 'package:klipy_dart/src/models/media_object.dart';

part 'media_formats.g.dart';

/// Based on [content formats](https://docs.klipy.com/migrate-from-tenor/response-objects/content-formats) from the KLIPY API.
///
/// For mobile, use the nano- or tiny-sized files for previews and the tiny-sized files for shares.
@JsonSerializable(explicitToJson: true)
class KlipyMediaFormats {
  static const _encoder = JsonEncoder.withIndent('  ');

  @JsonKey(name: KlipyMediaFormat.gif)
  final KlipyMediaObject? gif;

  @JsonKey(name: KlipyMediaFormat.gifTransparent)
  final KlipyMediaObject? gifTransparent;

  @JsonKey(name: KlipyMediaFormat.loopedMp4)
  final KlipyMediaObject? loopedMp4;

  @JsonKey(name: KlipyMediaFormat.mediumGif)
  final KlipyMediaObject? mediumGif;

  @JsonKey(name: KlipyMediaFormat.mp4)
  final KlipyMediaObject? mp4;

  @JsonKey(name: KlipyMediaFormat.nanoGif)
  final KlipyMediaObject? nanoGif;

  @JsonKey(name: KlipyMediaFormat.nanoGifTransparent)
  final KlipyMediaObject? nanoGifTransparent;

  @JsonKey(name: KlipyMediaFormat.nanoMp4)
  final KlipyMediaObject? nanoMp4;

  @JsonKey(name: KlipyMediaFormat.nanoWebm)
  final KlipyMediaObject? nanoWebm;

  @JsonKey(name: KlipyMediaFormat.nanoWebpTransparent)
  final KlipyMediaObject? nanoWebpTransparent;

  @JsonKey(name: KlipyMediaFormat.preview)
  final KlipyMediaObject? preview;

  @JsonKey(name: KlipyMediaFormat.tinyGif)
  final KlipyMediaObject? tinyGif;

  @JsonKey(name: KlipyMediaFormat.tinyGifTransparent)
  final KlipyMediaObject? tinyGifTransparent;

  @JsonKey(name: KlipyMediaFormat.tinyMp4)
  final KlipyMediaObject? tinyMp4;

  @JsonKey(name: KlipyMediaFormat.tinyWebm)
  final KlipyMediaObject? tinyWebm;

  @JsonKey(name: KlipyMediaFormat.tinyWebpTransparent)
  final KlipyMediaObject? tinyWebpTransparent;

  @JsonKey(name: KlipyMediaFormat.webm)
  final KlipyMediaObject? webm;

  @JsonKey(name: KlipyMediaFormat.webpTransparent)
  final KlipyMediaObject? webpTransparent;

  const KlipyMediaFormats({
    this.gif,
    this.gifTransparent,
    this.loopedMp4,
    this.mediumGif,
    this.mp4,
    this.nanoGif,
    this.nanoGifTransparent,
    this.nanoMp4,
    this.nanoWebm,
    this.nanoWebpTransparent,
    this.preview,
    this.tinyGif,
    this.tinyGifTransparent,
    this.tinyMp4,
    this.tinyWebm,
    this.tinyWebpTransparent,
    this.webm,
    this.webpTransparent,
  });

  factory KlipyMediaFormats.fromJson(Map<String, dynamic> json) =>
      _$KlipyMediaFormatsFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyMediaFormatsToJson(this);

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
