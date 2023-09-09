import { UserId } from "../../../domain/model/user";
import * as grpc from "../../grpc/proto_ts_gen/user/user_pb";


export function toUserId(id: grpc.UserId): UserId {
    return id.getId();
}