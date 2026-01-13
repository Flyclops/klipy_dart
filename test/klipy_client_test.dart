import 'package:mocktail/mocktail.dart';
import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

import 'mocks/mocks.dart';

void main() {
  group('KlipyClient >', () {
    final mockKlipyHttpClient = MockKlipyHttpClient();
    final klipyClient =
        KlipyClient(apiKey: '12345', client: mockKlipyHttpClient);

    setUpAll(() {
      registerFallbackValue(KlipyEndpoint.featured);
      registerFallbackValue(Duration.zero);
    });

    tearDown(() {
      reset(mockKlipyHttpClient);
    });

    test('Make sure it is the right type', () {
      expect(klipyClient, isA<KlipyClient>());
    });
    group('.featured() >', () {
      test('should call getGifs', () async {
        when(
          () => mockKlipyHttpClient.getGifs(
            any(),
            any(),
            any(),
            aspectRatioRange: any(named: 'aspectRatioRange'),
            limit: any(named: 'limit'),
            mediaFilter: any(named: 'mediaFilter'),
            sticker: any(named: 'sticker'),
          ),
        ).thenAnswer((_) async {
          return KlipyResponse(
            results: [],
          );
        });

        final test = await klipyClient.featured();

        verify(
          () => mockKlipyHttpClient.getGifs(
            any(),
            any(),
            any(),
            aspectRatioRange: any(named: 'aspectRatioRange'),
            limit: any(named: 'limit'),
            mediaFilter: any(named: 'mediaFilter'),
            sticker: any(named: 'sticker'),
          ),
        ).called(1);

        expect(test, isNotNull);
      });
    });
    group('.search() >', () {
      test('should return null if provided an empty string', () async {
        final response = await klipyClient.search('  ');
        expect(response, isNull);
      });
      test('should call getGifs', () async {
        when(
          () => mockKlipyHttpClient.getGifs(
            any(),
            any(),
            any(),
            aspectRatioRange: any(named: 'aspectRatioRange'),
            limit: any(named: 'limit'),
            mediaFilter: any(named: 'mediaFilter'),
            sticker: any(named: 'sticker'),
          ),
        ).thenAnswer((_) async {
          return KlipyResponse(results: []);
        });

        final test = await klipyClient.search('domino');

        verify(
          () => mockKlipyHttpClient.getGifs(
            any(),
            any(),
            any(),
            aspectRatioRange: any(named: 'aspectRatioRange'),
            limit: any(named: 'limit'),
            mediaFilter: any(named: 'mediaFilter'),
            sticker: any(named: 'sticker'),
          ),
        ).called(1);

        expect(test, isNotNull);
      });
    });
    group('.searchSuggestions() >', () {
      test('should return an empty list if search is empty', () async {
        final response = await klipyClient.searchSuggestions('  ');
        expect(response, []);
      });
      test('should call request - success', () async {
        final testSuggestions = ['domino is fun', 'domino is cool'];
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': testSuggestions,
          };
        });

        final response = await klipyClient.searchSuggestions('domino');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, testSuggestions);
      });
      test('should call request - success', () async {
        final testSuggestions = ['domino is fun', 'domino is cool'];
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': testSuggestions,
          };
        });

        final response = await klipyClient.searchSuggestions('domino');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, testSuggestions);
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': null,
          };
        });

        final response = await klipyClient.searchSuggestions('domino');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });

      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.searchSuggestions('domino');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
    });
    group('.trendingSearchTerms() >', () {
      test('should call request - success', () async {
        final testTrendingTerms = ['domino is fun', 'domino is cool'];
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': testTrendingTerms,
          };
        });

        final response = await klipyClient.trendingSearchTerms();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, testTrendingTerms);
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': null,
          };
        });

        final response = await klipyClient.trendingSearchTerms();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.trendingSearchTerms();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
    });
    group('.autocomplete() >', () {
      test('should return an empty list if provided an empty string', () async {
        final response = await klipyClient.autocomplete('  ');
        expect(response, []);
      });
      test('should call request - success', () async {
        final testAutocomplete = ['domino'];
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': testAutocomplete,
          };
        });

        final response = await klipyClient.autocomplete('dom');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, testAutocomplete);
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': null,
          };
        });

        final response = await klipyClient.autocomplete('dom');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.autocomplete('dom');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
    });
    group('.categories() >', () {
      test('should call request - success', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'tags': [
              {
                'image': 'domino.png',
                'name': 'domino',
                'path': 'domino',
                'searchterm': 'domino',
              },
            ],
          };
        });

        final response = await klipyClient.categories();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response.first.image, 'domino.png');
        expect(response.first.name, 'domino');
        expect(response.first.path, 'domino');
        expect(response.first.searchTerm, 'domino');
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'data': null,
          };
        });

        final response = await klipyClient.categories();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.categories();

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
    });
    group('.registerShare() >', () {
      test('should call request - success', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'status': 'OK',
          };
        });

        final response = await klipyClient.registerShare('1234');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, true);
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'status': null,
          };
        });

        final response = await klipyClient.registerShare('1234');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, false);
      });
      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.registerShare('1234');

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, false);
      });
    });
    group('.posts() >', () {
      test('should call request - success', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': [
              KlipyResultsObject(
                created: DateTime.now().millisecondsSinceEpoch.toDouble(),
                hasAudio: false,
                id: '1234',
                tags: ['gifs'],
                title: 'a test gif',
                contentDescription: 'a test gif',
                itemUrl: 'some-url.com',
                hasCaption: false,
                flags: ['sticker'],
                url: 'some-url.com',
              ).toJson(),
            ],
          };
        });

        final response = await klipyClient.posts(ids: ['1234']);

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response.first.id, '1234');
      });
      test('should call request - results null', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {
            'results': null,
          };
        });

        final response = await klipyClient.posts(ids: ['1234']);

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
      test('should call request - results empty', () async {
        when(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).thenAnswer((_) async {
          return {};
        });

        final response = await klipyClient.posts(ids: ['1234']);

        verify(
          () => mockKlipyHttpClient.request(
            any(),
            any(),
          ),
        ).called(1);

        expect(response, []);
      });
    });
  });
}
