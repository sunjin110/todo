import { Timestamp } from "google-protobuf/google/protobuf/timestamp_pb";
import { Session } from "../../../domain/model/authentication";
import * as grpc from "../../grpc/proto_ts_gen/authentication/authentication_pb";


export function toGrpcSession(session: Session): grpc.Session {
    const grpcSession = new grpc.Session();
    grpcSession.setSession(session.session);
    if (session.expire_time) {
        const t = new Timestamp();
        t.fromDate(session.expire_time);
        grpcSession.setExpireTime(t);
    }
    return grpcSession;
}
