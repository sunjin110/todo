enum UseCaseErrorCode {
  internal,
  session, // session切れなどの問題
}

class UseCaseException implements Exception {
  final String _message;
  final UseCaseErrorCode _errorCode;
  final Exception? exception;
  const UseCaseException(this._errorCode, this._message, {this.exception});

  UseCaseException.wrap(
      UseCaseErrorCode errorCode, String message, Exception this.exception)
      : _errorCode = errorCode,
        _message = message;

  @override
  String toString() {
    if (exception == null) {
      return _message;
    }

    return "$_message ${exception.toString()}";
  }

  UseCaseErrorCode errorCode() {
    return _errorCode;
  }
}
