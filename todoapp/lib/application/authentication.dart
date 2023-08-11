import 'package:todoapp/domain/model/user_auth.dart' as $model;

abstract class AuthenticationUseCaseInterface {
  Future<void> signIn(String email, String password);
}

class AuthenticationUseCase implements AuthenticationUseCaseInterface {
  @override
  Future<void> signIn(String email, String password) async {
    throw UnimplementedError();
  }
}
