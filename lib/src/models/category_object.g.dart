// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'category_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyCategoryObject _$KlipyCategoryObjectFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['searchterm', 'path', 'image', 'name'],
  );
  return KlipyCategoryObject(
    searchTerm: json['searchterm'] as String,
    path: json['path'] as String,
    image: json['image'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$KlipyCategoryObjectToJson(
        KlipyCategoryObject instance) =>
    <String, dynamic>{
      'searchterm': instance.searchTerm,
      'path': instance.path,
      'image': instance.image,
      'name': instance.name,
    };
