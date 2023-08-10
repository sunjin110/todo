class User {
  final UserId id;
  final String name;
  final String email;
  final String password;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});
}

class UserId {
  final String id;
  UserId({required this.id});
}
