/// Exception thrown when network connectivity or communication fails.
///
/// Raised in the network layer when HTTP requests encounter network-level errors.
class NetworkException implements Exception {
  /// Creates a [NetworkException] with the given [message].
  const NetworkException({
    this.message = 'Network communication failed.',
  });

  /// The error message describing the network failure.
  final String message;
}
