import 'package:btg_funds/core/core.dart' show NetworkException, ServerException, TimeoutException;
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Intercepts and converts HTTP errors to application-level exceptions.
/// Maps DioException types to domain-specific exception types with descriptive messages.
class ErrorInterceptor extends Interceptor {
  final _logger = Logger();

  /// Categorizes [DioException] errors and converts to application-level exceptions.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        _logger.w('Network: Connection timeout - took too long to establish connection');

        handler.reject(
          err.copyWith(
            error: const TimeoutException(
              message: 'Slow connection. Check your internet.',
            ),
          ),
        );
        return;

      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        _logger.w('Network: Request timeout - server took too long to respond');

        handler.reject(
          err.copyWith(
            error: const TimeoutException(
              message: 'Slow server. Try again.',
            ),
          ),
        );
        return;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;

        _logger.e('Network: Server error - HTTP $statusCode');

        handler.reject(
          err.copyWith(
            error: ServerException(
              statusCode: statusCode,
              message: _getServerErrorMessage(statusCode),
            ),
          ),
        );
        return;

      case DioExceptionType.connectionError:
        _logger.w('Network: No internet connection');

        handler.reject(
          err.copyWith(
            error: const NetworkException(
              message: 'No connection. Check your internet.',
            ),
          ),
        );
        return;

      case DioExceptionType.badCertificate:
        _logger.e('Network: SSL certificate error');

        handler.reject(
          err.copyWith(
            error: const NetworkException(
              message: 'Security error. Contact support.',
            ),
          ),
        );
        return;

      case DioExceptionType.cancel:
        _logger.w('Network: Request cancelled');
        handler.reject(err);
        return;

      case DioExceptionType.unknown:
        _logger.e('Network: Unknown error - ${err.message}');

        handler.reject(
          err.copyWith(
            error: const NetworkException(
              message: 'Unexpected error. Try again.',
            ),
          ),
        );
        return;
    }
  }

  /// Maps HTTP status codes to user-friendly error messages.
  String _getServerErrorMessage(int? statusCode) {
    return switch (statusCode) {
      400 => 'Invalid request. Try again.',
      401 || 403 => 'Unauthorized. Sign in again.',
      404 => 'Resource not found.',
      429 => 'Too many requests. Try later.',
      500 || 502 => 'Server error. Try later.',
      503 => 'Server maintenance. Try later.',
      _ => 'Server error ($statusCode). Try again.',
    };
  }
}
