import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// Based on [category response object](https://developers.google.com/tenor/guides/response-objects-and-errors#category-object) from the Tenor API.
@JsonSerializable()
class TenorCategory {
  static const _encoder = JsonEncoder.withIndent('  ');

  /// The search term that corresponds to the category. The search term is translated to match the locale of the corresponding request.
  @JsonKey(name: 'searchterm', disallowNullValue: true)
  final String searchTerm;

  /// The search URL to request if the user selects the category.
  @JsonKey(name: 'path', disallowNullValue: true)
  final String path;

  /// A URL to the media source for the category's example GIF
  @JsonKey(name: 'image', disallowNullValue: true)
  final String image;

  /// Category name to overlay over the image. The name is translated to match the locale of the corresponding request.
  @JsonKey(name: 'name', disallowNullValue: true)
  final String name;

  const TenorCategory({
    required this.searchTerm,
    required this.path,
    required this.image,
    required this.name,
  });

  factory TenorCategory.fromJson(Map<String, dynamic> json) =>
      _$TenorCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TenorCategoryToJson(this);

  // coverage:ignore-start
  @override
  String toString() => _encoder.convert(toJson());
  // coverage:ignore-end

  /// Creates a copy of this [TenorCategory] but with the given fields replaced with the new values.
  TenorCategory copyWith({
    String? image,
    String? name,
    String? path,
    String? searchTerm,
  }) {
    return TenorCategory(
      image: image ?? this.image,
      name: name ?? this.name,
      path: path ?? this.path,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
