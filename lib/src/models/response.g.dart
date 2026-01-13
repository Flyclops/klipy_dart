// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlipyResponse _$KlipyResponseFromJson(Map<String, dynamic> json) =>
    KlipyResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => KlipyResultsObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      aspectRatioRange: $enumDecodeNullable(
              _$TenorAspectRatioRangeEnumMap, json['aspect_ratio_range']) ??
          TenorAspectRatioRange.all,
      endpoint: $enumDecodeNullable(_$TenorEndpointEnumMap, json['endpoint']),
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
          _$TenorAspectRatioRangeEnumMap[instance.aspectRatioRange]!,
      'endpoint': _$TenorEndpointEnumMap[instance.endpoint],
      'media_filter': instance.mediaFilter,
      'next': instance.next,
      'parameters': instance.parameters,
      'timeout': instance.timeout.inMicroseconds,
    };

const _$TenorAspectRatioRangeEnumMap = {
  TenorAspectRatioRange.all: 'all',
  TenorAspectRatioRange.wide: 'wide',
  TenorAspectRatioRange.standard: 'standard',
};

const _$TenorEndpointEnumMap = {
  TenorEndpoint.autocomplete: 'autocomplete',
  TenorEndpoint.categories: 'categories',
  TenorEndpoint.featured: 'featured',
  TenorEndpoint.posts: 'posts',
  TenorEndpoint.registershare: 'registershare',
  TenorEndpoint.search: 'search',
  TenorEndpoint.search_suggestions: 'search_suggestions',
  TenorEndpoint.trending_terms: 'trending_terms',
};
