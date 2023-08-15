enum UseCaseErrorCode {
  internalError('internal_error', '', ''),
  notFoundSession('not_found_session', 'not_found_session', '認証切れ'),
  sessionExpired('session_expired', 'session_expired', '認証期限切れ');

  final String _code;
  final String _title;
  final String _message;

  const UseCaseErrorCode(this._code, this._title, this._message);

  String get code => _code;
  String get title => _title;
  String get message => _message;

  static UseCaseErrorCode? fromCode(String code) =>
      values.firstWhere((element) => element.code == code);
}

class UseCaseException {
  final UseCaseErrorCode errorCode;
  final dynamic info;
  const UseCaseException(this.errorCode, {this.info});
  factory UseCaseException.fromCode(String errorCode) {
    final errorInfo = UseCaseErrorCode.fromCode(errorCode);
    if (errorInfo == null) {
      throw const UseCaseException(UseCaseErrorCode.internalError);
    }
    return UseCaseException(errorInfo);
  }
}
