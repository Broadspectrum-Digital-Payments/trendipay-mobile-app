class NoInternetException implements Exception {
  @override
  String toString() => 'No Internet';
}

class ServerException implements Exception {
  const ServerException({
    required this.message,
  });
  final String message;
}

class NullException implements Exception {
  @override
  String toString() => 'null ';
}
