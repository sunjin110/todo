import 'package:todoapp/application/error.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/service/authentication.dart';
import 'package:todoapp/domain/service/error.dart';

class BaseUseCase {
  final AuthenticationService _authenticationService;

  BaseUseCase(this._authenticationService);

  Future<Session> localVerification(DateTime txTime) async {
    try {
      return await _authenticationService.verification(txTime);
    } on ServiceException catch (e) {
      switch (e.errorCode()) {
        case ServiceErrorCode.notFoundSession:
        case ServiceErrorCode.sessionExpired:
          throw UseCaseException.wrap(UseCaseErrorCode.session, "session", e);
        default:
          throw UseCaseException.wrap(UseCaseErrorCode.internal, "session", e);
      }
    } on Exception catch (e) {
      throw UseCaseException.wrap(UseCaseErrorCode.internal, "session", e);
    }
  }
}
