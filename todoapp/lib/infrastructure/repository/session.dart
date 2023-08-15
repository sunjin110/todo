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
    // 1recordしか入らないのでこれでいい
    realm.deleteAll<$dto.Session>();
  }

  @override
  Future<$model.Session?> get() async {
    final result = realm.query<$dto.Session>(_key);
    final sessionDto = result.elementAtOrNull(0);
    if (sessionDto == null) {
      return null;
    }
    return $model.Session(
        session: sessionDto.session, expireTime: sessionDto.expireTime);
  }

  @override
  Future<void> set($model.Session session) async {
    final sessionDto = $dto.Session(_key, session.session, session.expireTime);
    realm.add(sessionDto);
  }
}
