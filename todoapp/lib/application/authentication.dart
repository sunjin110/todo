import 'package:todoapp/infrastructure/repository/authentication.dart';

abstract class AuthenticationUseCaseInterface {
  Future<void> signIn(String email, String password);
}

class AuthenticationUseCase implements AuthenticationUseCaseInterface {
  final AuthenticationRepository authenticationRepository;

  AuthenticationUseCase({required this.authenticationRepository});

  @override
  Future<void> signIn(String email, String password) async {
    throw UnimplementedError();
  }
}
