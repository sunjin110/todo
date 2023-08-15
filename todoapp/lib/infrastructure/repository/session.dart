import 'package:todoapp/domain/model/user_auth.dart' as $model;
import 'package:todoapp/domain/repository/session.dart' as $repository;
import 'package:realm/realm.dart';

const _key = "my_session_key";

class SessionRepository implements $repository.SessionRepository {
  final Realm realm;
  SessionRepository(this.realm);

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<$model.Session> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> set($model.Session session) {
    // TODO: implement set
    throw UnimplementedError();
  }
}
