import 'package:btg_funds/core/core.dart' show NetworkException, ServerException, TimeoutException;
import 'package:dio/dio.dart';

/// Maps [DioException] to application-level exceptions.
///
/// This mapper centralizes the conversion of Dio exceptions into domain-specific
/// exceptions that can be handled consistently across the application.
class DioExceptionMapper {
  /// Maps a [DioException] to an application-level [Exception].
  ///
  /// If the exception already contains an application-level error,
  /// it returns that directly. Otherwise, it maps based on the exception type.
  static Exception map(DioException e) {
    final error = e.error;

    // If the error is already an Exception, return it directly
    if (error is Exception) {
      return error;
    }

    // Map based on DioException type
    return switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => const TimeoutException(),
      DioExceptionType.connectionError => const NetworkException(),
      DioExceptionType.badResponse => ServerException(
        statusCode: e.response?.statusCode,
      ),
      _ => const NetworkException(
        message: 'Unexpected error.',
      ),
    };
  }
}
