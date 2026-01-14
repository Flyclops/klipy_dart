import 'package:klipy_dart/src/utilities/utilities.dart';
import 'package:test/test.dart';

void main() {
  group('String Extensions >', () {
    group('.withQueryParams() >', () {
      group('extend false >', () {
        final url = 'https://example.com';
        final urlWithParams = url.withQueryParams({
          'key': '1234',
          'q': 'some-cool-gif',
        });

        expect(urlWithParams, 'https://example.com?key=1234&q=some-cool-gif');
      });
      group('extend true >', () {
        final url = 'https://example.com?key=1234';
        final urlWithParams = url.withQueryParams(
          {
            'q': 'some-cool-gif',
            'country': 'us',
          },
          extend: true,
        );

        expect(
          urlWithParams,
          'https://example.com?key=1234&q=some-cool-gif&country=us',
        );
      });
      group('null excluded >', () {
        final url = 'https://example.com?key=1234';
        final urlWithParams = url.withQueryParams({
          'q': 'some-cool-gif',
          'nullTest': null,
          'country': 'us',
        });

        expect(
          urlWithParams,
          'https://example.com?key=1234&q=some-cool-gif&country=us',
        );
      });
      group('empty string excluded >', () {
        final url = 'https://example.com?key=1234';
        final urlWithParams = url.withQueryParams({
          'q': 'some-cool-gif',
          'emptyStringTest': '',
          'country': 'us',
        });

        expect(
          urlWithParams,
          'https://example.com?key=1234&q=some-cool-gif&country=us',
        );
      });
    });
  });
}
