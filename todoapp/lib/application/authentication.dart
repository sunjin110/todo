import 'package:todoapp/infrastructure/repository/authentication.dart';
import 'package:todoapp/infrastructure/repository/session.dart';

abstract class AuthenticationUseCaseInterface {
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
    final session = await authenticationRepository.signIn(email, password);
    print(session.session);
    await sessionRepository.set(session);
    return;
  }
}
