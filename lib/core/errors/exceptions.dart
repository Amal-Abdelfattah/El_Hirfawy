class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Something went wrong with the server.'});
}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Please check your internet connection.'});
}

class CacheException implements Exception {
  final String message;

  CacheException({
    this.message = 'Something went wrong while accessing local data.',
  });
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({this.message = 'You are not authorized.'});
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({this.message = 'The requested resource was not found.'});
}
