import 'package:todoapp/application/error.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/infrastructure/repository/authentication.dart';
import 'package:todoapp/infrastructure/repository/session.dart';

abstract interface class AuthenticationUseCaseInterface {
  Future<void> signIn(String email, String password);
}

class AuthenticationUseCase implements AuthenticationUseCaseInterface {
  final AuthenticationRepository authenticationRepository;
  final SessionRepository sessionRepository;

  AuthenticationUseCase(
      {required this.authenticationRepository,
      required this.sessionRepository});

  @override
  Future<void> signIn(String email, String password) async {
    final Session session;

    try {
      session = await authenticationRepository.signIn(email, password);
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed sign in");
    }

    try {
      await sessionRepository.set(session);
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed set session");
    }
  }
}
