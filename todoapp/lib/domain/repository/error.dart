enum RepositoryErrorCode {
  internal,
  unauthorized,
}

class RepositoryException implements Exception {
  final String _message;
  final RepositoryErrorCode _errorCode;
  final Exception? cause;
  const RepositoryException(this._errorCode, this._message, {this.cause});

  RepositoryException.wrap(
      this._errorCode, this._message, Exception this.cause);

  RepositoryErrorCode get errorCode => _errorCode;

  @override
  String toString() {
    if (cause == null) {
      return _message;
    }
    return "$_message ${cause.toString()}";
  }
}
