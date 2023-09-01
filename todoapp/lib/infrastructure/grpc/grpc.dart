import 'package:grpc/grpc.dart';
import 'package:todoapp/infrastructure/grpc/proto_dart_gen/google/protobuf/timestamp.pb.dart';

DateTime convertTimestampToDateTime(Timestamp timestamp) {
  return timestamp.toDateTime();
}

ClientChannel newClientChannel(String host, int port, bool tls) {
  var credential = const ChannelCredentials.insecure();
  if (tls) {
    credential = const ChannelCredentials.secure();
  }

  return ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      credentials: credential,
    ),
  );
}
