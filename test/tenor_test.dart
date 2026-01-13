import 'package:mocktail/mocktail.dart';
import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

import 'mocks/mocks.dart';

void main() {
  group('Tenor >', () {
    final mockKlipyHttpClient = MockKlipyHttpClient();
    final tenorClient = Tenor(apiKey: '12345', client: mockKlipyHttpClient);

    setUpAll(() {
      registerFallbackValue(TenorEndpoint.featured);
      registerFallbackValue(Duration.zero);
    });

    tearDown(() {
      reset(mockKlipyHttpClient);
    });

    test('Make sure it is the right type', () {
      expect(tenorClient, isA<Tenor>());
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

        final test = await tenorClient.featured();

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
        final response = await tenorClient.search('  ');
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

        final test = await tenorClient.search('domino');

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
        final response = await tenorClient.searchSuggestions('  ');
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

        final response = await tenorClient.searchSuggestions('domino');

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

        final response = await tenorClient.searchSuggestions('domino');

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

        final response = await tenorClient.searchSuggestions('domino');

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

        final response = await tenorClient.searchSuggestions('domino');

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

        final response = await tenorClient.trendingSearchTerms();

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

        final response = await tenorClient.trendingSearchTerms();

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

        final response = await tenorClient.trendingSearchTerms();

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
        final response = await tenorClient.autocomplete('  ');
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

        final response = await tenorClient.autocomplete('dom');

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

        final response = await tenorClient.autocomplete('dom');

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

        final response = await tenorClient.autocomplete('dom');

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

        final response = await tenorClient.categories();

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

        final response = await tenorClient.categories();

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

        final response = await tenorClient.categories();

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

        final response = await tenorClient.registerShare('1234');

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

        final response = await tenorClient.registerShare('1234');

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

        final response = await tenorClient.registerShare('1234');

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

        final response = await tenorClient.posts(ids: ['1234']);

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

        final response = await tenorClient.posts(ids: ['1234']);

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

        final response = await tenorClient.posts(ids: ['1234']);

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
