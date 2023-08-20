import 'package:grpc/grpc.dart';
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/google/protobuf/timestamp.pb.dart';

DateTime convertTimestampToDateTime(Timestamp timestamp) {
  return timestamp.toDateTime();
}

ClientChannel newClientChannel(String host, int port) {
  return ClientChannel(host,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
}
