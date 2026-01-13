import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:klipy_dart/klipy_dart.dart';
import 'package:test/test.dart';

import 'mocks/mocks.dart';

class _ClientSocketException extends Mock implements ClientException {}

void main() {
  group('KlipyHttpClient >', () {
    final mockHttpClient = MockHttpClient();
    final klipyClient = KlipyHttpClient(mockHttpClient);

    setUpAll(() {
      registerFallbackValue(Uri());
    });

    tearDown(() {
      reset(mockHttpClient);
    });

    group('.request() >', () {
      test('successful', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          return Response('{"value":true}', 200);
        });

        final response = await klipyClient.request(
          'a-fake-url',
          Duration(seconds: 2),
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expect(response['value'], true);
      });

      test('failure - TenorApiException', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          return Response('{"value":true}', 404);
        });

        final response = klipyClient.request(
          'a-fake-url',
          Duration(seconds: 2),
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expectLater(response, throwsA(isA<TenorApiException>()));
      });

      test('failure - TenorNetworkException', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          await Future.delayed(Duration(seconds: 2));
          return Response('{"value":true}', 404);
        });

        final response = klipyClient.request(
          'a-fake-url',
          Duration(seconds: 1),
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expectLater(response, throwsA(isA<TenorNetworkException>()));
      });

      test('failure - ClientException', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          throw _ClientSocketException();
        });

        final response = klipyClient.request(
          'a-fake-url',
          Duration(seconds: 1),
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expectLater(response, throwsA(isA<TenorNetworkException>()));
      });
    });
    group('.getGifs() >', () {
      test('successful', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          return Response('{"results":[]}', 200);
        });

        final response = await klipyClient.getGifs(
          TenorEndpoint.featured,
          Duration(seconds: 2),
          '',
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expect(response, isNotNull);
      });

      test('path', () async {
        when(() => mockHttpClient.get(any())).thenAnswer((_) async {
          return Response(
            """
            {
              "aspect_ratio_range": "standard",
              "content_filter": "high",
              "media_filter": ["tinymp4"],
              "results": [],
              "next": "efgh"
            }
            """,
            200,
          );
        });

        final response = await klipyClient.getGifs(
          TenorEndpoint.featured,
          Duration(seconds: 2),
          '?key=1234',
          aspectRatioRange: TenorAspectRatioRange.standard,
          mediaFilter: [KlipyMediaFormat.tinyMp4],
          pos: 'abcd',
          random: true,
          sticker: true,
        );

        verify(() => mockHttpClient.get(any())).called(1);

        expect(response, isNotNull);
        expect(response?.aspectRatioRange, TenorAspectRatioRange.standard);
        expect(response?.endpoint, TenorEndpoint.featured);
        expect(response?.mediaFilter, [KlipyMediaFormat.tinyMp4]);
        expect(response?.next, "efgh");
        expect(response?.parameters, '?key=1234');
        expect(response?.results, []);
        expect(response?.timeout, Duration(seconds: 2));
      });
    });
  });
}
