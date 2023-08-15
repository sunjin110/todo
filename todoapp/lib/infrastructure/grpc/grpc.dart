import 'package:grpc/grpc.dart' as $grpc;
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/google/protobuf/timestamp.pb.dart';
import 'dart:ffi';

DateTime convertTimestampToDateTime(Timestamp timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(
      (timestamp.seconds * 1000 + (timestamp.nanos ~/ 1000000) as Int64) as int,
      isUtc: true);
}
