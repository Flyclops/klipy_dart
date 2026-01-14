// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyResponse _$KlipyResponseFromJson(Map<String, dynamic> json) =>
    KlipyResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => KlipyResultObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      aspectRatioRange: $enumDecodeNullable(
              _$KlipyAspectRatioRangeEnumMap, json['aspect_ratio_range']) ??
          KlipyAspectRatioRange.all,
      endpoint: $enumDecodeNullable(_$KlipyEndpointEnumMap, json['endpoint']),
      mediaFilter: (json['media_filter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [KlipyMediaFormat.tinyGif],
      next: json['next'] as String?,
      parameters: json['parameters'] as String?,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 5)
          : Duration(microseconds: (json['timeout'] as num).toInt()),
    );

Map<String, dynamic> _$KlipyResponseToJson(KlipyResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
      'aspect_ratio_range':
          _$KlipyAspectRatioRangeEnumMap[instance.aspectRatioRange]!,
      'endpoint': _$KlipyEndpointEnumMap[instance.endpoint],
      'media_filter': instance.mediaFilter,
      'next': instance.next,
      'parameters': instance.parameters,
      'timeout': instance.timeout.inMicroseconds,
    };

const _$KlipyAspectRatioRangeEnumMap = {
  KlipyAspectRatioRange.all: 'all',
  KlipyAspectRatioRange.wide: 'wide',
  KlipyAspectRatioRange.standard: 'standard',
};

const _$KlipyEndpointEnumMap = {
  KlipyEndpoint.autocomplete: 'autocomplete',
  KlipyEndpoint.categories: 'categories',
  KlipyEndpoint.featured: 'featured',
  KlipyEndpoint.posts: 'posts',
  KlipyEndpoint.registershare: 'registershare',
  KlipyEndpoint.search: 'search',
  KlipyEndpoint.search_suggestions: 'search_suggestions',
  KlipyEndpoint.trending_terms: 'trending_terms',
};
