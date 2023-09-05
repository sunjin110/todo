import { UserId } from "./user";

export type TodoId = string;

export enum TodoStatus {
    Done = 0,
    Scheduled = 1,
    Draft = 2,
};

export type Todo = {
    id: TodoId;
    title: string;
    description: string;
    status: TodoStatus;
    user_id: UserId;
    create_time: Date;
    done_time?: Date;
};

