enum ServiceErrorCode {
  internal,
  sessionExpired,
  notFoundSession,
}

class ServiceException implements Exception {
  final String _message;
  final ServiceErrorCode _errorCode;
  final Exception? exception;
  const ServiceException(this._errorCode, this._message, {this.exception});

  ServiceException.wrap(
      ServiceErrorCode errorCode, String message, Exception this.exception)
      : _errorCode = errorCode,
        _message = message;

  @override
  String toString() {
    if (exception == null) {
      return _message;
    }

    return "$_message ${exception.toString()}";
  }

  ServiceErrorCode get errorCode => _errorCode;
}
