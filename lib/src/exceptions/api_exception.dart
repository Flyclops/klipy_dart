class KlipyApiException implements Exception {
  int code;
  String? message;

  KlipyApiException({
    required this.code,
    this.message,
  });

  // coverage:ignore-start
  @override
  String toString() => "KlipyApiException code: $code, message: $message";
  // coverage:ignore-end
}
