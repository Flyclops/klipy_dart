import 'package:klipy_dart/src/constants/constants.dart';
import 'package:klipy_dart/src/http_client.dart';
import 'package:klipy_dart/src/models/category_object.dart';
import 'package:klipy_dart/src/models/response.dart';
import 'package:klipy_dart/src/models/result_object.dart';
import 'package:klipy_dart/src/utilities/utilities.dart';

/// A client to interact with the [KLIPY API](https://docs.klipy.com/migrate-from-tenor).
class KlipyClient {
  /// Your API key provided by [KLIPY](https://docs.klipy.com/getting-started).
  final String apiKey;

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
  final KlipyHttpClient? client;

  const KlipyClient({
    required this.apiKey,
    this.country = 'US',
    this.locale = 'en_US',
    this.networkTimeout = const Duration(seconds: 5),
    this.client,
  });

  // Shortcut for getting which client to use
  KlipyHttpClient get _client => client ?? KlipyHttpClient();

  /// Returns a `KlipyResponse` of current global featured GIFs, updated regularly throughout the day.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/features
  ///
  ///```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// KlipyResponse? response = await klipyClient.featured(limit: 5);
  ///```
  Future<KlipyResponse?> featured({
    int limit = 20,
    KlipyAspectRatioRange aspectRatioRange = KlipyAspectRatioRange.all,
    List<String> mediaFilter = const [KlipyMediaFormat.tinyGif],
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
      KlipyEndpoint.featured,
      networkTimeout,
      parameters,
      limit: limit,
      mediaFilter: mediaFilter,
      pos: pos,
      sticker: sticker,
    );
  }

  /// Returns a `KlipyResponse` containing the most relevant GIFs based on your specific search terms, categories, or emoji inputs. You can use any combination of these filters.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/search
  ///
  ///```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// KlipyResponse? res = await klipyClient.search('universe', limit: 5);
  ///```
  Future<KlipyResponse?> search(
    String search, {
    int limit = 20,
    KlipyAspectRatioRange aspectRatioRange = KlipyAspectRatioRange.all,
    List<String> mediaFilter = const [KlipyMediaFormat.tinyGif],
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
      KlipyEndpoint.search,
      networkTimeout,
      parameters,
      limit: limit,
      aspectRatioRange: aspectRatioRange,
      mediaFilter: mediaFilter,
      pos: pos,
      sticker: sticker,
      random: random,
    );
  }

  /// Returns a `List<String>` of alternative search terms related to the user's search.
  ///
  /// Suggestions are ordered by their likelihood to drive a share, based on historical search and share behavior.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/search-suggestions
  ///
  /// ```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// List<String> suggestions = await klipyClient.searchSuggestions('laugh', limit: 5);
  /// ```
  Future<List<String>> searchSuggestions(
    String search, {
    int limit = 20,
  }) async {
    // search can't be empty
    if (search.trim().isEmpty) return [];
    // setup path
    var path = KlipyEndpoint.search_suggestions.name.withQueryParams({
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

  /// Returns a `List<String>` containing the current trending search terms.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/trending-search-terms
  ///
  /// ```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// List<String> trendingSearchTerms = await klipyClient.trendingSearchTerms(limit: 5);
  ///```
  Future<List<String>> trendingSearchTerms({
    int limit = 20,
  }) async {
    // setup path
    var path = KlipyEndpoint.trending_terms.name.withQueryParams({
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
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/autocomplete
  ///
  /// ```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// List<String> autocompleteItems = await klipyClient.autocomplete('pro', limit: 5);
  ///```
  Future<List<String>> autocomplete(
    String search, {
    int limit = 20,
  }) async {
    // search can't be empty
    if (search.trim().isEmpty) return [];
    // setup path
    var path = KlipyEndpoint.autocomplete.name.withQueryParams({
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

  /// Returns a `List<KlipyCategoryObject>` of GIF categories based on the specified type. Each category includes a search URL that preserves the parameters from the original request.
  ///
  /// Each `KlipyCategory` includes a corresponding `path` to use if the user clicks on the category. The `path` includes any parameters from the original call to the Categories KlipyEndpoint.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/categories
  ///
  ///```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// List<KlipyCategoryObject> categories = await klipyClient.requestCategories();
  ///```
  Future<List<KlipyCategoryObject>> categories({
    KlipyCategoryType categoryType = KlipyCategoryType.featured,
  }) async {
    // setup path
    var path = KlipyEndpoint.categories.name.withQueryParams({
      'key': apiKey,
      'country': country,
      'locale': locale,
      'type': categoryType.name,
    });
    // ask for data
    var data = await _client.request(path, networkTimeout);
    // form list of categories
    var list = <KlipyCategoryObject>[];

    if (data['tags'] != null) {
      data['tags'].forEach((tag) {
        list.add(KlipyCategoryObject.fromJson(tag));
      });
    }
    return list;
  }

  /// This endpoint registers when a user shares a GIF or sticker.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/register-share
  ///
  ///```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// bool wasShared = await klipyClient.registerShare('12345');
  ///```
  Future<bool> registerShare(
    /// The id of a Response Object
    String id, {
    /// The search string that leads to this share.
    String? search,
  }) async {
    // setup path
    var path = KlipyEndpoint.registershare.name.withQueryParams({
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

  /// Retrieve specific GIFs, stickers, or a combination of both by providing their IDs.
  ///
  /// Documentation: https://docs.klipy.com/migrate-from-tenor/posts
  ///
  ///```dart
  /// var klipyClient = KlipyClient(apiKey: 'YOUR_KEY');
  /// List<KlipyResultObject> posts = await klipyClient.posts(ids: ['3526696', '25055384']);
  ///```
  Future<List<KlipyResultObject>> posts({
    required List<String> ids,
    List<String> mediaFilter = const [KlipyMediaFormat.tinyGif],
  }) async {
    // setup path
    var path = KlipyEndpoint.posts.name.withQueryParams({
      'key': apiKey,
      'ids': ids.join(','),
      'media_filter': mediaFilter.join(','),
    });
    // ask for data
    var data = await _client.request(path, networkTimeout);
    // form list of categories
    var list = <KlipyResultObject>[];
    if (data['results'] != null) {
      data['results'].forEach((post) {
        list.add(KlipyResultObject.fromJson(post));
      });
    }
    return list;
  }
}
