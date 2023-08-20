import 'package:todoapp/domain/repository/error.dart';
import 'package:todoapp/domain/service/error.dart';

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

  UseCaseErrorCode get errorCode => _errorCode;
}

UseCaseException defaultUseCaseErrorHandling(Object e, String msg) {
  if (e is UseCaseException) {
    throw e;
  }

  if (e is RepositoryException) {
    if (e.errorCode == RepositoryErrorCode.unauthorized) {
      throw UseCaseException.wrap(UseCaseErrorCode.session, msg, e);
    }
    throw UseCaseException.wrap(UseCaseErrorCode.internal, msg, e);
  }

  if (e is ServiceException) {
    switch (e.errorCode) {
      case ServiceErrorCode.notFoundSession:
      case ServiceErrorCode.sessionExpired:
        throw UseCaseException.wrap(UseCaseErrorCode.session, msg, e);
      default:
        throw UseCaseException.wrap(UseCaseErrorCode.internal, msg, e);
    }
  }

  if (e is Exception) {
    throw UseCaseException.wrap(UseCaseErrorCode.internal, msg, e);
  }

  throw UseCaseException.wrap(UseCaseErrorCode.internal, msg, Exception(e));
}
