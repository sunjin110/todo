import 'package:todoapp/domain/model/user.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/repository.dart';

abstract class UserRepository {
  Future<ListOutput> list(ListInput input);
  Future<User> get(Session session, UserId id);
  Future<void> create(Session session, CreateUser user);
  Future<void> update(Session session, UpdateUser user);
  Future<void> delete(Session session, UserId id);
}

class ListInput {
  final Session session;
  final Paging paging;
  final UserFilter? filter;
  final UserSort? sort;
  ListInput(
      {required this.session,
      required this.paging,
      required this.filter,
      required this.sort});
}

class UserFilter {
  final UserId? id;
  final FilterField<String>? name;
  final FilterField<String>? email;
  UserFilter({required this.id, required this.name, required this.email});
}

class UserSort {
  final SortField lastLogin;
  final SortField createTime;
  UserSort({required this.lastLogin, required this.createTime});
}

class ListOutput {
  final bool hasNext;
  final List<User> users;
  ListOutput({required this.hasNext, required this.users});
}

class CreateUser {
  final String name;
  final String email;
  final String? password;
  final UserSignUpStatus status;
  CreateUser(
      {required this.name,
      required this.email,
      required this.password,
      required this.status});
}

class UpdateUser {
  final UserId id;
  final String? name;
  final String? email;
  final String? password;
  final UserSignUpStatus? status;
  UpdateUser(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.status});
}
