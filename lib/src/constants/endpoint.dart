// ignore_for_file: constant_identifier_names

/// Implemented endpoints from the [Klipy API](https://developers.google.com/tenor/guides/endpoints)
enum TenorEndpoint {
  /// [More Info](https://docs.klipy.com/migrate-from-tenor/autocomplete) from the Klipy API Docs.
  autocomplete,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/categories) from the Klipy API Docs.
  categories,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/features) from the Klipy API Docs.
  featured,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/posts) from the Klipy API Docs.
  posts,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/register-share) from the Klipy API Docs.
  registershare,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/search) from the Klipy API Docs.
  search,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/search-suggestions) from the Klipy API Docs.'
  search_suggestions,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/trending-search-terms) from the Klipy API Docs.
  trending_terms,
}
