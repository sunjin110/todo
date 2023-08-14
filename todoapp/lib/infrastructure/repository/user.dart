import 'package:todoapp/domain/model/user.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/user.dart' as $repository;
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/user/user.pbgrpc.dart'
    as $user;
import 'package:todoapp/infrastructure/repository/authentication.dart';

class UserRepository implements $repository.UserRepository {
  final $user.UserRpcClient client;
  UserRepository({required this.client});

  @override
  Future<void> create(Session session, $repository.CreateUser user) async {
    final input = $user.CreateInput();
    input.session = convertToGrpcSession(session);
    input.user = UserConverter.toGrpcCreateUser(user);
    await client.create(input);
  }

  @override
  Future<void> delete(Session session, UserId id) async {
    final input = $user.DeleteInput();
    input.session = convertToGrpcSession(session);
    input.id = UserConverter.toGrpcUserId(id);
    await client.delete(input);
  }

  @override
  Future<User> get(Session session, UserId id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<$repository.ListOutput> list($repository.ListInput input) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<void> update(Session session, $repository.UpdateUser user) async {
    final input = $user.UpdateInput();
    input.session = convertToGrpcSession(session);
    input.user = UserConverter.toGrpcUpdateUser(user);
    await client.update(input);
  }
}

class UserConverter {
  static $user.CreateUser toGrpcCreateUser(
      $repository.CreateUser repoCreateUser) {
    final createUser = $user.CreateUser();
    createUser.name = repoCreateUser.name;
    createUser.email = repoCreateUser.email;
    if (repoCreateUser.password != null) {
      createUser.password = repoCreateUser.password!;
    }
    createUser.status = convertToGrpcUserSignUpStatus(repoCreateUser.status);
    return createUser;
  }

  static $user.UpdateUser toGrpcUpdateUser(
      $repository.UpdateUser repoUpdateUser) {
    final updateUser = $user.UpdateUser();
    updateUser.id = toGrpcUserId(repoUpdateUser.id);
    if (repoUpdateUser.name != null) {
      updateUser.name = repoUpdateUser.name!;
    }

    if (repoUpdateUser.email != null) {
      updateUser.email = repoUpdateUser.email!;
    }

    if (repoUpdateUser.password != null) {
      updateUser.password = repoUpdateUser.password!;
    }

    if (repoUpdateUser.status != null) {
      updateUser.status = convertToGrpcUserSignUpStatus(repoUpdateUser.status!);
    }
    return updateUser;
  }

  static $user.UserId toGrpcUserId(UserId id) {
    final grpcId = $user.UserId();
    grpcId.id = id.toString();
    return grpcId;
  }
}
