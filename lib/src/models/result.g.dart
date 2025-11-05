// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorResult _$TenorResultFromJson(Map<String, dynamic> json) => TenorResult(
      contentDescription: json['content_description'] as String,
      created: (json['created'] as num).toDouble(),
      flags:
          (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      hasAudio: json['hasaudio'] as bool? ?? false,
      hasCaption: json['hascaption'] as bool? ?? false,
      id: json['id'] as String,
      itemUrl: json['itemurl'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['title'] as String,
      url: json['url'] as String,
      bgColor: json['bg_color'] as String?,
      media: json['media_formats'] == null
          ? const TenorMediaFormats()
          : TenorMediaFormats.fromJson(
              json['media_formats'] as Map<String, dynamic>),
      source: json['source'] as String?,
    );

Map<String, dynamic> _$TenorResultToJson(TenorResult instance) =>
    <String, dynamic>{
      'created': instance.created,
      'hasaudio': instance.hasAudio,
      'id': instance.id,
      'media_formats': instance.media.toJson(),
      'tags': instance.tags,
      'title': instance.title,
      'content_description': instance.contentDescription,
      'itemurl': instance.itemUrl,
      'hascaption': instance.hasCaption,
      'flags': instance.flags,
      'bg_color': instance.bgColor,
      'url': instance.url,
      'source': instance.source,
    };
