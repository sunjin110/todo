import { Session, UserSignUpStatus } from "../model/authentication";

export interface AuthenticationRepository {
    signUp(name: string, email: string, password: string): Promise<SignUpOutput>;
    signIn(email: string, password: string): Promise<SignInOutput>;
    signOut(session: Session): Promise<void>;
};

export type SignUpOutput = {
    session?: Session;
    status: UserSignUpStatus;
};

export type SignInOutput = {
    session?: Session;
};

