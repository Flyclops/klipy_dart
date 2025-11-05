// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'media_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorMediaObject _$TenorMediaObjectFromJson(Map<String, dynamic> json) =>
    TenorMediaObject(
      url: json['url'] as String,
      dimensions: TenorMediaObject.dimensionsfromJson(json['dims'] as List),
      duration: (json['duration'] as num?)?.toDouble() ?? 0,
      size: (json['size'] as num).toInt(),
    );

Map<String, dynamic> _$TenorMediaObjectToJson(TenorMediaObject instance) =>
    <String, dynamic>{
      'url': instance.url,
      'dims': TenorMediaObject.dimensionsToJson(instance.dimensions),
      'duration': instance.duration,
      'size': instance.size,
    };
