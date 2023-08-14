import 'package:todoapp/domain/model/user.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/user.dart' as $repository;
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/user/user.pbgrpc.dart'
    as $user;
import 'package:todoapp/infrastructure/repository/authentication.dart';
import 'package:todoapp/infrastructure/repository/repository.dart';

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
  Future<User> get(Session session, UserId id) async {
    final input = $user.GetInput();
    input.session = convertToGrpcSession(session);
    input.id = UserConverter.toGrpcUserId(id);
    final res = await client.get(input);
    return UserConverter.toModelUser(res.user);
  }

  @override
  Future<$repository.ListOutput> list($repository.ListInput input) async {
    final grpcInput = $user.ListInput();
    grpcInput.session = convertToGrpcSession(input.session);

    if (input.filter != null) {
      grpcInput.filter = UserConverter.toGrpcUserFilter(input.filter!);
    }
    if (input.sort != null) {
      grpcInput.sort = UserConverter.toGrpcUserSort(input.sort!);
    }
    grpcInput.paging = convertPaging(input.paging);

    final res = await client.list(grpcInput);
    return $repository.ListOutput(
        hasNext: res.hasNext, users: UserConverter.toModelUsers(res.users));
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

  static UserId toModelUserId($user.UserId id) {
    return UserId(id: id.id);
  }

  static $user.UserFilter toGrpcUserFilter($repository.UserFilter filter) {
    final grpcFilter = $user.UserFilter();

    if (filter.id != null) {
      grpcFilter.id = toGrpcUserId(filter.id!);
    }

    if (filter.name != null) {
      grpcFilter.name = filter.name!.value;
      grpcFilter.nameFilterKind = convertFilterKind(filter.name!.kind);
    }

    if (filter.email != null) {
      grpcFilter.email = filter.email!.value;
      grpcFilter.emailFilterKind = convertFilterKind(filter.email!.kind);
    }
    return grpcFilter;
  }

  static $user.UserSort toGrpcUserSort($repository.UserSort sort) {
    final grpcSort = $user.UserSort();
    if (sort.createTime != null) {
      grpcSort.createTime = convertSortField(sort.createTime!);
    }

    if (sort.lastLogin != null) {
      grpcSort.lastLogin = convertSortField(sort.lastLogin!);
    }
    return grpcSort;
  }

  static User toModelUser($user.User user) {
    return User(
        id: toModelUserId(user.id),
        name: user.name,
        email: user.email,
        password: '');
  }

  static List<User> toModelUsers(List<$user.User> users) {
    return List.generate(users.length, (index) => toModelUser(users[index]));
  }
}
