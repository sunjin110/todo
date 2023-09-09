import { Session } from "../../domain/model/authentication";
import { AuthenticationRepository, SignInOutput, SignUpOutput } from "../../domain/repository/authentication";
import { AuthenticationClient } from "../grpc/proto_ts_gen/authentication/AuthenticationServiceClientPb";
import * as grpc from "../grpc/proto_ts_gen/authentication/authentication_pb";
import { toGrpcSession, toSession, toUserSignUpStatus } from "./converter/authentication";

export class AuthenticationGrpcRepository implements AuthenticationRepository {
    client: AuthenticationClient;
    constructor(client: AuthenticationClient) {
        this.client = client;
    }
    async signUp(name: string, email: string, password: string): Promise<SignUpOutput> {
        const input = new grpc.SignUpInput();
        input.setName(name);
        input.setEmail(email);
        input.setPassword(password);

        const result = await this.client.signUp(input, null);

        return {
            session: toSession(result.getSession()),
            status: toUserSignUpStatus(result.getStatus()),
        };
    }
    async signIn(email: string, password: string): Promise<SignInOutput> {
        const input = new grpc.SignInInput();
        input.setEmail(email);
        input.setPassword(password);

        const result = await this.client.signIn(input, null);
        return {
            session: toSession(result.getSession()),
        };
    }

    async signOut(session: Session): Promise<void> {
        const input = new grpc.SignOutInput();
        input.setSession(toGrpcSession(session));
        await this.client.signOut(input, null);
    }
}
