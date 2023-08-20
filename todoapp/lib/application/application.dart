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
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed local verification");
    }
  }
}
