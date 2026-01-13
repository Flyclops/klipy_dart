import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/http_client.dart';
import 'package:tenor_dart/src/models/category.dart';
import 'package:tenor_dart/src/models/response.dart';
import 'package:tenor_dart/src/models/result.dart';
import 'package:tenor_dart/src/utilities/utilities.dart';

/// A client to interact with the [Tenor API v2](https://developers.google.com/tenor/guides/quickstart).
class Tenor {
  /// Your API key provided by [Tenor](https://developers.google.com/tenor/guides/quickstart).
  final String apiKey;

  /// Specify the [content safety filter](https://developers.google.com/tenor/guides/content-filtering) level.
  final TenorContentFilter contentFilter;

  /// Specify the country of origin for the request. To do so, provide its two-letter [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes) country code. **Format:** YY
  final String country;

  /// Specify the default language to interpret the search string. **Format:** xx_YY
  ///
  /// **xx** is the [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code.
  ///
  /// **_YY** *(optional)* is the [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes) country code.
  ///
  /// You can use the country code that you provide in locale to differentiate between dialects of the given language.
  final String locale;

  /// The maximum time to wait for a network request to complete.
  ///
  /// Network exceptions are handled by the library and will return `null` if the request fails.
  final Duration networkTimeout;

  /// Mostly used for testing purposes.
  final TenorHttpClient? client;

  const Tenor({
    required this.apiKey,
    this.contentFilter = TenorContentFilter.off,
    this.country = 'US',
    this.locale = 'en_US',
    this.networkTimeout = const Duration(seconds: 5),
    this.client,
  });

  // Shortcut for getting which client to use
  TenorHttpClient get _client => client ?? TenorHttpClient();

  /// Get a JSON object that contains a list of the current global featured GIFs. Tenor updates the featured stream regularly throughout the day.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#featured
  ///
  ///```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// TenorResponse? response = await tenorClient.featured(limit: 5);
  ///```
  Future<TenorResponse?> featured({
    int limit = 20,
    TenorAspectRatioRange aspectRatioRange = TenorAspectRatioRange.all,
    List<String> mediaFilter = const [TenorMediaFormat.tinyGif],
    bool sticker = false,
    String? pos,
  }) async {
    // setup parameters
    var parameters = ''.withQueryParams({
      'key': apiKey,
      'country': country,
      'locale': locale,
    });
    return await _client.getGifs(
      TenorEndpoint.featured,
      networkTimeout,
      parameters,
      contentFilter: contentFilter,
      limit: limit,
      mediaFilter: mediaFilter,
      pos: pos,
      sticker: sticker,
    );
  }

  /// Get a JSON object that contains a list of the most relevant GIFs for a given set of search terms, categories, emojis, or any combination of these.
  ///
  /// When you include the URL parameter searchfilter=sticker in the request, Tenor's search endpoint returns stickers rather than GIFs. The Response Objects in sticker search responses include transparent formats under the media_formats field.
  ///
  /// To return the results in a randomized order, instead of them being ordered by relevance, include the URL parameter random=true.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#search
  ///
  ///```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// TenorResponse? res = await tenorClient.search('universe', limit: 5);
  ///```
  Future<TenorResponse?> search(
    String search, {
    int limit = 20,
    TenorAspectRatioRange aspectRatioRange = TenorAspectRatioRange.all,
    List<String> mediaFilter = const [TenorMediaFormat.tinyGif],
    String? pos,
    bool sticker = false,
    bool random = false,
  }) async {
    // search can't be empty
    if (search.trim().isEmpty) return null;
    // setup parameters
    var parameters = ''.withQueryParams({
      'key': apiKey,
      'q': search,
      'country': country,
      'locale': locale,
    });
    return await _client.getGifs(
      TenorEndpoint.search,
      networkTimeout,
      parameters,
      limit: limit,
      contentFilter: contentFilter,
      aspectRatioRange: aspectRatioRange,
      mediaFilter: mediaFilter,
      pos: pos,
      sticker: sticker,
      random: random,
    );
  }

  /// Search suggestions help a user narrow their search or discover related search terms to find a more precise GIF.
  ///
  /// The API returns results in order of what is most likely to drive a share for a given term, based on historic user search and share behavior.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#search-suggestions
  ///
  /// ```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<String> suggestions = await tenorClient.searchSuggestions('laugh', limit: 5);
  /// ```
  Future<List<String>> searchSuggestions(
    String search, {
    int limit = 20,
  }) async {
    // search can't be empty
    if (search.trim().isEmpty) return [];
    // setup path
    var path = TenorEndpoint.search_suggestions.name.withQueryParams({
      'key': apiKey,
      'q': search,
      'country': country,
      'locale': locale,
      'limit': limit.clamp(1, 50),
    });
    // send request
    var response = await _client.request(path, networkTimeout);
    // return empty
    if (response.isEmpty || response['results'] == null) {
      return <String>[];
    }
    // return results
    return List.from(response['results']);
  }

  /// Returns a `List<String>` of the current trending search terms. Tenor's AI updates the list hourly.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#trending-search
  ///
  /// ```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<String> trendingSearchTerms = await tenorClient.trendingSearchTerms(limit: 5);
  ///```
  Future<List<String>> trendingSearchTerms({
    int limit = 20,
  }) async {
    // setup path
    var path = TenorEndpoint.trending_terms.name.withQueryParams({
      'key': apiKey,
      'country': country,
      'locale': locale,
      'limit': limit.clamp(1, 50),
    });
    // send request
    var response = await _client.request(path, networkTimeout);
    // return empty
    if (response.isEmpty || response['results'] == null) {
      return <String>[];
    }
    // return results
    return List.from(response['results']);
  }

  /// Get a `List<String>` of completed search terms for a given partial search term.
  ///
  /// The list is sorted by Tenor's AI and the number of results decreases as Tenor's AI becomes more certain.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#autocomplete
  ///
  /// ```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<String> autocompleteItems = await tenorClient.autocomplete('pro', limit: 5);
  ///```
  Future<List<String>> autocomplete(
    String search, {
    int limit = 20,
  }) async {
    // search can't be empty
    if (search.trim().isEmpty) return [];
    // setup path
    var path = TenorEndpoint.autocomplete.name.withQueryParams({
      'key': apiKey,
      'q': search,
      'country': country,
      'locale': locale,
      'limit': limit.clamp(1, 50),
    });
    // send request
    var response = await _client.request(path, networkTimeout);
    // return empty
    if (response.isEmpty || response['results'] == null) {
      return <String>[];
    }
    // return results
    return List.from(response['results']);
  }

  /// Returns a `List<TenorCategory>` of GIF categories associated with the provided `TenorCategoryType`.
  ///
  /// Each `TenorCategory` includes a corresponding `path` to use if the user clicks on the category. The `path` includes any parameters from the original call to the Categories TenorEndpoint.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#categories
  ///
  ///```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<TenorCategory> categories = await tenorClient.requestCategories();
  ///```
  Future<List<TenorCategory>> categories({
    TenorCategoryType categoryType = TenorCategoryType.featured,
  }) async {
    // setup path
    var path = TenorEndpoint.categories.name.withQueryParams({
      'key': apiKey,
      'country': country,
      'locale': locale,
      'type': categoryType.name,
      'contentfilter': contentFilter.name,
    });
    // ask for data
    var data = await _client.request(path, networkTimeout);
    // form list of categories
    var list = <TenorCategory>[];

    if (data['tags'] != null) {
      data['tags'].forEach((tag) {
        list.add(TenorCategory.fromJson(tag));
      });
    }
    return list;
  }

  /// Register a user's sharing of a GIF or sticker.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#register-share
  ///
  ///```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<TenorCategory> categories = await tenorClient.registerShare('12345');
  ///```
  Future<bool> registerShare(
    /// The id of a Response Object
    String id, {
    /// The search string that leads to this share.
    String? search,
  }) async {
    // setup path
    var path = TenorEndpoint.registershare.name.withQueryParams({
      'key': apiKey,
      'id': id,
      'country': country,
      'locale': locale,
      'q': search,
    });

    var result = await _client.request(path, networkTimeout);
    if (result.isNotEmpty &&
        result['status']?.toString().toLowerCase() == 'ok') {
      return true;
    }
    return false;
  }

  /// Get the GIFs, stickers, or a combination of the two for the specified IDs.
  ///
  /// Documentation: https://developers.google.com/tenor/guides/endpoints#posts
  ///
  ///```dart
  /// var tenorClient = Tenor(apiKey: 'YOUR_KEY');
  /// List<TenorResults> posts = await tenorClient.posts(ids: ['3526696', '25055384']);
  ///```
  Future<List<TenorResult>> posts({
    required List<String> ids,
    List<String> mediaFilter = const [TenorMediaFormat.tinyGif],
  }) async {
    // setup path
    var path = TenorEndpoint.posts.name.withQueryParams({
      'key': apiKey,
      'ids': ids.join(','),
      'media_filter': mediaFilter.join(','),
    });
    // ask for data
    var data = await _client.request(path, networkTimeout);
    // form list of categories
    var list = <TenorResult>[];
    if (data['results'] != null) {
      data['results'].forEach((post) {
        list.add(TenorResult.fromJson(post));
      });
    }
    return list;
  }
}
