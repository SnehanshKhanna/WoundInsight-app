class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  AppException(this.message, {this.statusCode, this.data});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException([String? message])
      : super(message ?? "Can't reach the server. Check your connection and try again.");
}

class TimeoutException extends AppException {
  TimeoutException([String? message])
      : super(message ?? "This is taking longer than expected. Please try again.");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message ?? "Your session has expired. Please log in again.", statusCode: 401);
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? "This scan or resource is no longer available.", statusCode: 404);
}

class ValidationException extends AppException {
  final Map<String, dynamic>? errors;
  ValidationException(super.message, {this.errors, super.statusCode = 422})
      : super(data: errors);
}

class ServerException extends AppException {
  ServerException([String? message, int? statusCode])
      : super(message ?? "Something went wrong on our end. Please try again shortly.", statusCode: statusCode ?? 500);
}
