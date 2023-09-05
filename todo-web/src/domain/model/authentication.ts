
export type Session = {
    session: string;
    expire_time?: Date;
};

export enum UserSignUpStatus {
    Unknown = 0,
    Allowed = 1,
    WaitForAllow = 2,
    Denied = 3,
};

