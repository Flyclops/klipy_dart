import 'package:mocktail/mocktail.dart';
import 'package:klipy_dart/klipy_dart.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

class MockKlipyHttpClient extends Mock implements KlipyHttpClient {}

class MockKlipyResponse extends Mock implements KlipyResponse {}
