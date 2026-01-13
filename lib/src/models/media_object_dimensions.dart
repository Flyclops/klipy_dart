import 'package:json_annotation/json_annotation.dart';

part 'media_object_dimensions.g.dart';

@JsonSerializable(explicitToJson: true)
class KlipyMediaObjectDimensions {
  @JsonKey(
    name: 'dims',
    required: true,
    includeFromJson: true,
    includeIfNull: false,
    includeToJson: true,
  )
  final List<int> _dimensions;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double width;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double height;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late final double aspectRatio;

  KlipyMediaObjectDimensions(this._dimensions) {
    if (_dimensions.length != 2) {
      throw ArgumentError.value(
        _dimensions,
        '_dimensions',
        'It must be a list with a length of 2',
      );
    }

    width = _dimensions.first.toDouble();
    height = _dimensions.last.toDouble();
    aspectRatio = width / height;
  }

  factory KlipyMediaObjectDimensions.fromJson(Map<String, dynamic> json) =>
      _$KlipyMediaObjectDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$KlipyMediaObjectDimensionsToJson(this);

  // coverage:ignore-start
  @override
  String toString() =>
      'KlipyMediaObjectDimensions(width: $width, height: $height, aspectRatio: $aspectRatio)';
  // coverage:ignore-end
}
