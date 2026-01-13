import 'package:flutter_config/flutter_config.dart';
import 'package:flutter/material.dart';
import 'package:klipy_dart/klipy_dart.dart';

void main() async {
  // only used to load api key from .env file, not required
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KLIPY Dart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'KLIPY Dart Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<KlipyResultsObject> searchResults = [];
  List<KlipyResultsObject> featuredResults = [];
  List<KlipyResultsObject> postsResults = [];
  List<KlipyCategoryObject?> categoryResults = [];
  List<String?> autocompleteResults = [];
  List<String?> trendingSearchTermsResults = [];
  List<String?> searchSuggestionsResults = [];
  KlipyResultsObject? randomGif;

  @override
  void initState() {
    super.initState();
    getData();
  }

  /// In this function we will fetch data from every endpoint available
  /// in the KLIPY API and store it in the state so we can display it.
  void getData() async {
    // replace apiKey with an api key provided by KLIPY > https://docs.klipy.com/getting-started
    final String apiKey = FlutterConfig.get('KLIPY_API_KEY');
    var klipyClient = KlipyClient(apiKey: apiKey);

    ///
    /// Search GIFs for "domino" keyword
    ///
    final searchResponse = await klipyClient.search('domino', limit: 5);
    if (searchResponse?.results.isNotEmpty ?? false) {
      setState(() {
        searchResults = searchResponse!.results;
      });
    }
    // fetch 5 more
    final searchResponseNext = await searchResponse?.fetchNext(limit: 5);
    if (searchResponseNext?.results.isNotEmpty ?? false) {
      setState(() {
        final clonedResults = [...searchResults];
        clonedResults.addAll(searchResponseNext!.results);
        searchResults = clonedResults;
      });
    }

    ///
    /// Random GIF for "domino"
    ///
    final randomResponse =
        await klipyClient.search('domino', limit: 1, random: true);
    if (randomResponse?.results.isNotEmpty ?? false) {
      setState(() {
        randomGif = randomResponse!.results.first;
      });
    }

    ///
    /// Fetch Featured GIFs
    ///
    final featuredResponse = await klipyClient.featured(limit: 5);
    if (featuredResponse?.results.isNotEmpty ?? false) {
      setState(() {
        featuredResults = featuredResponse!.results;
      });
    }
    // fetch 5 more
    final featuredNext = await featuredResponse?.fetchNext(limit: 5);
    if (featuredNext?.results.isNotEmpty ?? false) {
      setState(() {
        final clonedResults = [...featuredResults];
        clonedResults.addAll(featuredNext!.results);
        featuredResults = clonedResults;
      });
    }

    ///
    /// Posts - Fetch GIFs by ID
    ///
    var postsResponse = await klipyClient.posts(ids: ['2525964843568523']);
    setState(() {
      postsResults = postsResponse;
    });

    ///
    /// Featured Categories
    ///
    final categoryResponse = await klipyClient.categories();
    setState(() {
      categoryResults = categoryResponse;
    });

    ///
    /// Autocomplete for "pro"
    ///
    var autocompleteResponse = await klipyClient.autocomplete('pro', limit: 10);
    setState(() {
      autocompleteResults = autocompleteResponse;
    });

    ///
    /// Trending Search Terms
    ///
    var trendingSearchTermsResponse =
        await klipyClient.trendingSearchTerms(limit: 10);
    setState(() {
      trendingSearchTermsResults = trendingSearchTermsResponse;
    });

    ///
    /// Search Suggestions for "laugh"
    ///
    var searchSuggestionsResponse =
        await klipyClient.searchSuggestions('laugh', limit: 10);
    setState(() {
      searchSuggestionsResults = searchSuggestionsResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                // Display search results
                const Text(
                  'Search GIFs for "domino"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: searchResults.map(
                    (gif) {
                      final tinygif = gif.media.tinyGif;
                      if (tinygif == null) {
                        return const SizedBox();
                      }
                      return Expanded(
                        child: Image.network(
                          tinygif.url.toString(),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                // Display featured results
                const Text(
                  'Featured GIFs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: featuredResults.map(
                    (gif) {
                      final tinygif = gif.media.tinyGif;
                      if (tinygif == null) {
                        return const SizedBox();
                      }
                      return Expanded(
                        child: Image.network(
                          tinygif.url.toString(),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                // Display posts results
                const Text(
                  'Posts (2525964843568523)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: postsResults.map(
                    (gif) {
                      final tinygif = gif.media.tinyGif;
                      if (tinygif == null) {
                        return const SizedBox();
                      }
                      return SizedBox(
                        height: 75,
                        child: Image.network(
                          tinygif.url.toString(),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                // Display random gif
                const Text(
                  'Random GIF for "domino"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (randomGif?.media.tinyGif?.url != null)
                  Image.network(
                    randomGif!.media.tinyGif!.url,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 100,
                  ),
                const SizedBox(height: 16),
                // Display featured categories
                const Text(
                  'Featured Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categoryResults.map(
                    (category) {
                      if (category == null) {
                        return const SizedBox();
                      }
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.network(
                            category.image.toString(),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 100,
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            color: Colors.black.withValues(alpha: 0.3),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  category.searchTerm,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                // Display autocomplete results
                const Text(
                  'Autocomplete for "pro"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(autocompleteResults.join(', ')),
                ),
                const SizedBox(height: 16),
                // Display trending search terms
                const Text(
                  'Trending Search Terms',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(trendingSearchTermsResults.join(', ')),
                ),
                const SizedBox(height: 16),
                // Display search suggestions
                const Text(
                  'Search Suggestions for "laugh"',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(searchSuggestionsResults.join(', ')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
