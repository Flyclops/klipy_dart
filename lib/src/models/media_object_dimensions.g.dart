// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'media_object_dimensions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenorMediaObjectDimensions _$TenorMediaObjectDimensionsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['dims'],
  );
  return TenorMediaObjectDimensions(
    (json['dims'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  );
}

Map<String, dynamic> _$TenorMediaObjectDimensionsToJson(
        TenorMediaObjectDimensions instance) =>
    <String, dynamic>{
      'dims': instance._dimensions,
    };
