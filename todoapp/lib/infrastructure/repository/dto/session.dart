import 'package:realm/realm.dart';

part 'session.g.dart';

@RealmModel()
class _Session {
  @PrimaryKey()
  late String id;
  late String session;
  late DateTime expireTime;
}


// https://zenn.dev/polycome_toto/articles/483921792a29b3 TODO
