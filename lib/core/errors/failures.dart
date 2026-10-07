abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([
    super.message = 'Something went wrong with the server.',
  ]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([
    super.message = 'Please check your internet connection.',
  ]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Unable to load local data.']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'You are not authorized.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([
    super.message = 'The requested resource was not found.',
  ]);
}
