import 'package:todoapp/domain/model/user_auth.dart' as $model;

abstract class AuthenticationUseCaseInterface {
  Future<SignInOutput> signIn(SignInInput input);
}

class AuthenticationUseCase implements AuthenticationUseCaseInterface {
  @override
  Future<SignInOutput> signIn(SignInInput input) async {
    // return SignInOutput();
    throw UnimplementedError();
  }
}

class SignInOutput {
  final $model.Session? session;
  SignInOutput({required this.session});
}

class SignInInput {
  final String email;
  final String password;
  SignInInput({required this.email, required this.password});
}
