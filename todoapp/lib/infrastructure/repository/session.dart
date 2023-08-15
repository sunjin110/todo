import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/session.dart' as $repository;

class SessionRepository implements $repository.SessionRepository {
  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Session> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> set(Session session) {
    // TODO: implement set
    throw UnimplementedError();
  }
}
