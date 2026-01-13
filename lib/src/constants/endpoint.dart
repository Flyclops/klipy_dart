// ignore_for_file: constant_identifier_names

/// Implemented endpoints from the [KLIPY API](https://docs.klipy.com/migrate-from-tenor)
enum KlipyEndpoint {
  /// [More Info](https://docs.klipy.com/migrate-from-tenor/autocomplete) from the KLIPY API Docs.
  autocomplete,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/categories) from the KLIPY API Docs.
  categories,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/features) from the KLIPY API Docs.
  featured,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/posts) from the KLIPY API Docs.
  posts,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/register-share) from the KLIPY API Docs.
  registershare,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/search) from the KLIPY API Docs.
  search,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/search-suggestions) from the KLIPY API Docs.'
  search_suggestions,

  /// [More Info](https://docs.klipy.com/migrate-from-tenor/trending-search-terms) from the KLIPY API Docs.
  trending_terms,
}
