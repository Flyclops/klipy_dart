// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'media_formats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyMediaFormats _$KlipyMediaFormatsFromJson(Map<String, dynamic> json) =>
    KlipyMediaFormats(
      gif: json['gif'] == null
          ? null
          : KlipyMediaObject.fromJson(json['gif'] as Map<String, dynamic>),
      gifTransparent: json['gif_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['gif_transparent'] as Map<String, dynamic>),
      loopedMp4: json['loopedmp4'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['loopedmp4'] as Map<String, dynamic>),
      mediumGif: json['mediumgif'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['mediumgif'] as Map<String, dynamic>),
      mp4: json['mp4'] == null
          ? null
          : KlipyMediaObject.fromJson(json['mp4'] as Map<String, dynamic>),
      nanoGif: json['nanogif'] == null
          ? null
          : KlipyMediaObject.fromJson(json['nanogif'] as Map<String, dynamic>),
      nanoGifTransparent: json['nanogif_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['nanogif_transparent'] as Map<String, dynamic>),
      nanoMp4: json['nanomp4'] == null
          ? null
          : KlipyMediaObject.fromJson(json['nanomp4'] as Map<String, dynamic>),
      nanoWebm: json['nanowebm'] == null
          ? null
          : KlipyMediaObject.fromJson(json['nanowebm'] as Map<String, dynamic>),
      nanoWebpTransparent: json['nanowebp_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['nanowebp_transparent'] as Map<String, dynamic>),
      preview: json['preview'] == null
          ? null
          : KlipyMediaObject.fromJson(json['preview'] as Map<String, dynamic>),
      tinyGif: json['tinygif'] == null
          ? null
          : KlipyMediaObject.fromJson(json['tinygif'] as Map<String, dynamic>),
      tinyGifTransparent: json['tinygif_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['tinygif_transparent'] as Map<String, dynamic>),
      tinyMp4: json['tinymp4'] == null
          ? null
          : KlipyMediaObject.fromJson(json['tinymp4'] as Map<String, dynamic>),
      tinyWebm: json['tinywebm'] == null
          ? null
          : KlipyMediaObject.fromJson(json['tinywebm'] as Map<String, dynamic>),
      tinyWebpTransparent: json['tinywebp_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['tinywebp_transparent'] as Map<String, dynamic>),
      webm: json['webm'] == null
          ? null
          : KlipyMediaObject.fromJson(json['webm'] as Map<String, dynamic>),
      webpTransparent: json['webp_transparent'] == null
          ? null
          : KlipyMediaObject.fromJson(
              json['webp_transparent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KlipyMediaFormatsToJson(KlipyMediaFormats instance) =>
    <String, dynamic>{
      'gif': instance.gif?.toJson(),
      'gif_transparent': instance.gifTransparent?.toJson(),
      'loopedmp4': instance.loopedMp4?.toJson(),
      'mediumgif': instance.mediumGif?.toJson(),
      'mp4': instance.mp4?.toJson(),
      'nanogif': instance.nanoGif?.toJson(),
      'nanogif_transparent': instance.nanoGifTransparent?.toJson(),
      'nanomp4': instance.nanoMp4?.toJson(),
      'nanowebm': instance.nanoWebm?.toJson(),
      'nanowebp_transparent': instance.nanoWebpTransparent?.toJson(),
      'preview': instance.preview?.toJson(),
      'tinygif': instance.tinyGif?.toJson(),
      'tinygif_transparent': instance.tinyGifTransparent?.toJson(),
      'tinymp4': instance.tinyMp4?.toJson(),
      'tinywebm': instance.tinyWebm?.toJson(),
      'tinywebp_transparent': instance.tinyWebpTransparent?.toJson(),
      'webm': instance.webm?.toJson(),
      'webp_transparent': instance.webpTransparent?.toJson(),
    };
