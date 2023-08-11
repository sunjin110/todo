import 'package:todoapp/domain/model/user_auth.dart' as $model;

abstract class AuthenticationRepositoryImplement {
  Future<$model.Session> signIn(String email, String password);
  Future<SignUpOutput> signUp(String email, String password);
  Future<void> signOut($model.Session session);
}

class SignUpOutput {
  $model.Session? session;
  $model.UserSignUpStatus status;
  SignUpOutput({required this.session, required this.status});
}
