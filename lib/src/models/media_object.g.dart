// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'media_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyMediaObject _$KlipyMediaObjectFromJson(Map<String, dynamic> json) =>
    KlipyMediaObject(
      url: json['url'] as String,
      dimensions: KlipyMediaObject.dimensionsfromJson(json['dims'] as List),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$KlipyMediaObjectToJson(KlipyMediaObject instance) =>
    <String, dynamic>{
      'url': instance.url,
      'dims': KlipyMediaObject.dimensionsToJson(instance.dimensions),
      'duration': instance.duration,
      'size': instance.size,
    };
