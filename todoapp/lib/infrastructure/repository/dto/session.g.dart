// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Session extends _Session with RealmEntity, RealmObjectBase, RealmObject {
  Session(
    String id,
    String session,
    DateTime expireTime,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'session', session);
    RealmObjectBase.set(this, 'expireTime', expireTime);
  }

  Session._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get session => RealmObjectBase.get<String>(this, 'session') as String;
  @override
  set session(String value) => RealmObjectBase.set(this, 'session', value);

  @override
  DateTime get expireTime =>
      RealmObjectBase.get<DateTime>(this, 'expireTime') as DateTime;
  @override
  set expireTime(DateTime value) =>
      RealmObjectBase.set(this, 'expireTime', value);

  @override
  Stream<RealmObjectChanges<Session>> get changes =>
      RealmObjectBase.getChanges<Session>(this);

  @override
  Session freeze() => RealmObjectBase.freezeObject<Session>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Session._);
    return const SchemaObject(ObjectType.realmObject, Session, 'Session', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('session', RealmPropertyType.string),
      SchemaProperty('expireTime', RealmPropertyType.timestamp),
    ]);
  }
}
