import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:klipy_dart/klipy_dart.dart';

/// A class for handling requests to HTTP.
///
/// Needed as a class so it is easier to test/mock.
class KlipyHttpClient {
  final http.Client? client;

  const KlipyHttpClient([
    this.client,
  ]);

  http.Client get _client => client ?? http.Client();

  Future<Map<String, dynamic>> request(String url, Duration timeout) async {
    try {
      final response =
          await _client.get(Uri.parse(klipyApiUrl + url)).timeout(timeout);
      // get json
      final Map<String, dynamic> json = jsonDecode(response.body);

      // if an error is present, throw it
      if (json['error'] != null ||
          (response.statusCode != 200 && response.statusCode != 202)) {
        throw KlipyApiException(
          code: response.statusCode,
          message: json['errors'].toString(),
        );
      }
      // if no error, return the json for consumption
      return Future.value({
        ...json,
        // pass timeout back for fetchNext
        'timeout': timeout.inMicroseconds,
      });
    } on TimeoutException {
      throw KlipyNetworkException();
    } on http.ClientException catch (e) {
      if (e.runtimeType.toString() == '_ClientSocketException') {
        throw KlipyNetworkException();
      }
      rethrow;
    } catch (e) {
      print(e);
      // let the consumer handle it
      rethrow;
    }
  }

  /// Shared functionality between Search and Featured endpoints.
  Future<KlipyResponse?> getGifs(
    KlipyEndpoint endPoint,
    Duration timeout,
    String parameters, {
    int limit = 1,
    KlipyAspectRatioRange? aspectRatioRange,
    List<String>? mediaFilter,
    String? pos,
    bool sticker = false,
    bool random = false,
  }) async {
    var path = endPoint.name + parameters;

    path += '&limit=${limit.clamp(1, 50)}';

    if (sticker) {
      path += '&searchfilter=sticker';
    }
    // TODO this is currently broken in the Klipy API
    // if (random) {
    // path += '&random=$random';
    // }
    if (mediaFilter != null) {
      path += '&media_filter=${mediaFilter.join(',')}';
    }
    if (aspectRatioRange != null) {
      path += '&ar_range=${aspectRatioRange.name}';
    }
    if (pos != null) {
      path += '&pos=$pos';
    }

    var data = await request(path, timeout);
    KlipyResponse? res;
    if (data.isNotEmpty) {
      res = KlipyResponse.fromJson(
        {
          ...data,
          'endpoint': endPoint.name,
          'parameters': parameters,
        },
      );
    }
    return res;
  }
}
