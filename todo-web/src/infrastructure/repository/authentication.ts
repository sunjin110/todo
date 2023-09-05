import { Session, UserSignUpStatus } from "../../domain/model/authentication";

export interface AuthenticationRepository {
    signUp(name: string, email: string, password: string): SignUpOutput;
    signIn(email: string, password: string): SignInOutput;
    signOut(session: Session): void;
};

type SignUpOutput = {
    session?: Session;
    status: UserSignUpStatus;
};

type SignInOutput = {
    session?: Session;
};

