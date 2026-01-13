// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'media_object_dimensions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyMediaObjectDimensions _$KlipyMediaObjectDimensionsFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['dims'],
  );
  return KlipyMediaObjectDimensions(
    (json['dims'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  );
}

Map<String, dynamic> _$KlipyMediaObjectDimensionsToJson(
        KlipyMediaObjectDimensions instance) =>
    <String, dynamic>{
      'dims': instance._dimensions,
    };
