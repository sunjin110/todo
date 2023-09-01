import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/service/error.dart';
import 'package:todoapp/infrastructure/repository/session.dart';

abstract class AuthenticationService {
  Future<Session> verification(DateTime txTime);
}

AuthenticationService newAuthenticationService(
    SessionRepository sessionRepository) {
  return _AuthenticationService(sessionRepository);
}

class _AuthenticationService implements AuthenticationService {
  final SessionRepository _sessionRepository;

  _AuthenticationService(this._sessionRepository);

  @override
  Future<Session> verification(DateTime txTime) async {
    final session = await _sessionRepository.get();
    if (session == null) {
      throw const ServiceException(
          ServiceErrorCode.notFoundSession, "not found session");
    }
    if (session.expireTime.isBefore(txTime)) {
      throw ServiceException(ServiceErrorCode.sessionExpired,
          "expireTime: ${session.expireTime}, txTIme: $txTime");
    }
    return session;
  }
}
