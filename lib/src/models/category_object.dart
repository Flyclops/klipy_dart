import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category_object.g.dart';

/// Based on [category object](https://docs.klipy.com/migrate-from-tenor/response-objects/category-object) from the KLIPY API.
@JsonSerializable()
class KlipyCategoryObject {
  static const _encoder = JsonEncoder.withIndent('  ');

  /// The search term that corresponds to the category. The search term is translated to match the `locale` of the corresponding request.
  @JsonKey(name: 'searchterm', disallowNullValue: true)
  final String searchTerm;

  /// The search URL to request if the user selects the category.
  @JsonKey(name: 'path', disallowNullValue: true)
  final String path;

  /// A URL to the media source for the category's example GIF.
  @JsonKey(name: 'image', disallowNullValue: true)
  final String image;

  /// Category name to overlay over the image. The name is translated to match the `locale` of the corresponding request.
  @JsonKey(name: 'name', disallowNullValue: true)
  final String name;

  KlipyCategoryObject({
    required this.searchTerm,
    required this.path,
    required this.image,
    required this.name,
  });

  factory KlipyCategoryObject.fromJson(Map<String, dynamic> json) =>
      _$KlipyCategoryObjectFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyCategoryObjectToJson(this);

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end
}
