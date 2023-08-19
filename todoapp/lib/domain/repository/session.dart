import 'package:todoapp/domain/model/user_auth.dart' as $model;

abstract interface class SessionRepository {
  Future<$model.Session?> get();
  Future<void> set($model.Session session);
  Future<void> delete();
}
