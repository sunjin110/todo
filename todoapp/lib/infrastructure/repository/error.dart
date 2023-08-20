import 'package:grpc/grpc.dart';
import 'package:todoapp/domain/repository/error.dart';

RepositoryException defaultGrpcToRepositoryError(GrpcError e, String msg) {
  switch (e.code) {
    case StatusCode.unauthenticated:
      return RepositoryException.wrap(RepositoryErrorCode.unauthorized, msg, e);
    case StatusCode.unavailable:
      return RepositoryException.wrap(RepositoryErrorCode.unavailable, msg, e);
    default:
      return RepositoryException.wrap(RepositoryErrorCode.internal, msg, e);
  }
}
