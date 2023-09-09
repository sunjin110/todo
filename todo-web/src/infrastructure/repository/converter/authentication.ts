import { Timestamp } from "google-protobuf/google/protobuf/timestamp_pb";
import { Session, UserSignUpStatus } from "../../../domain/model/authentication";
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

export function toSession(session?: grpc.Session): Session | undefined {

    if (!session) {
        return undefined;
    }

    return {
        session: session.getSession(),
        expire_time: session.getExpireTime()?.toDate(),
    };
}

export function toUserSignUpStatus(status: grpc.UserSignUpStatus): UserSignUpStatus {
    switch (status) {
        case grpc.UserSignUpStatus.SIGNUPSIGNUPSTATUSUNKNOWN:
            return UserSignUpStatus.Unknown;
        case grpc.UserSignUpStatus.SIGNUPSIGNUPSTATUSWAITFORALLOW:
            return UserSignUpStatus.WaitForAllow;
        case grpc.UserSignUpStatus.SIGNUPSIGNUPSTATUSALLOWED:
            return UserSignUpStatus.Allowed;
        case grpc.UserSignUpStatus.SIGNUPSIGNUPSTATUSDENIED:
            return UserSignUpStatus.Denied;
    }
}
