import 'package:grpc/grpc.dart' as $grpc;
import 'package:todoapp/domain/model/user_auth.dart' as $model;
import 'package:todoapp/domain/repository/authentication.dart' as $repository;
import 'package:todoapp/infrastructure/grpc/grpc.dart';
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/authentication/authentication.pb.dart';
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/authentication/authentication.pbgrpc.dart'
    as $auth;
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/google/protobuf/timestamp.pb.dart';

class AuthenticationRepository implements $repository.AuthenticationRepository {
  final $auth.AuthenticationClient client;

  AuthenticationRepository({required this.client});

  @override
  Future<$model.Session> signIn(String email, String password) async {
    var input = SignInInput();
    input.email = email;
    input.password = password;

    final response = await client.signIn(input);

    return convertToModelSession(response.session);
  }

  @override
  Future<$repository.SignUpOutput> signUp(String email, String password) async {
    var input = SignUpInput();
    input.email = email;
    input.password = password;

    final res = await client.signUp(input);

    return $repository.SignUpOutput(
        session: convertToModelSession(res.session),
        status: convertToModelUserSignUpStatus(res.status));
  }

  @override
  Future<void> signOut($model.Session session) async {
    var input = SignOutInput();
    input.session = convertToGrpcSession(session);
    await client.signOut(input);
  }
}

$model.Session convertToModelSession(Session session) {
  return $model.Session(
      session: session.session,
      expireTime: convertTimestampToDateTime(session.expireTime));
}

Session convertToGrpcSession($model.Session session) {
  var s = Session();
  s.session = session.session;
  s.expireTime = Timestamp.fromDateTime(session.expireTime);
  return s;
}

$model.UserSignUpStatus convertToModelUserSignUpStatus(
    UserSignUpStatus status) {
  switch (status) {
    case UserSignUpStatus.SignupSignUpStatusAllowed:
      return $model.UserSignUpStatus.allowed;
    case UserSignUpStatus.SignupSignUpStatusDenied:
      return $model.UserSignUpStatus.denied;
    case UserSignUpStatus.SignupSignUpStatusWaitForAllow:
      return $model.UserSignUpStatus.waitForAllow;
    case UserSignUpStatus.SignupSignUpStatusUnknown:
      throw UnimplementedError("specified unknown sign up status");
    default:
      throw UnimplementedError("not implemented sign up status");
  }
}
