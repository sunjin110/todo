import 'package:todoapp/domain/model/user_auth.dart' as $model;
import 'package:todoapp/domain/repository/session.dart' as $repository;
import 'package:realm/realm.dart';
import 'package:todoapp/infrastructure/repository/dto/session.dart' as $dto;

const _key = "my_session_key";

class SessionRepository implements $repository.SessionRepository {
  final Realm realm;
  SessionRepository(this.realm);

  @override
  Future<void> delete() async {
    await realm.writeAsync(() => realm.deleteAll<$dto.Session>());
  }

  @override
  Future<$model.Session?> get() async {
    final sessionDto = realm.find<$dto.Session>(_key);
    if (sessionDto == null) {
      return null;
    }
    return $model.Session(
        session: sessionDto.session, expireTime: sessionDto.expireTime);
  }

  @override
  Future<void> set($model.Session session) async {
    // 先に削除
    await delete();

    final sessionDto = $dto.Session(_key, session.session, session.expireTime);
    await realm.writeAsync(() => realm.add(sessionDto));
  }
}
