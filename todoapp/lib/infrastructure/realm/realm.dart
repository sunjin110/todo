import 'package:realm/realm.dart';
import 'package:todoapp/infrastructure/repository/dto/session.dart';

Realm setupRealm() {
  final config = Configuration.local([getSessionSchemaObject()]);
  return Realm(config);
}
