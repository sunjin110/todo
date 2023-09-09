import { Session } from "../model/authentication";
import { Todo, TodoId, TodoStatus } from "../model/todo";
import { FilterField, Paging, SortField } from "./list";

export interface TodoRepository {
    list(input: ListInput): Promise<ListOutput>;
    get(input: GetInput): Promise<GetOutput>;
    create(input: CreateInput): Promise<void>;
    update(input: UpdateInput): Promise<void>;
    delete(input: DeleteInput): Promise<void>;
};

export type TodoFilter = {
    id?: TodoId;
    title?: FilterField<string>;
    description?: FilterField<string>;
    status?: TodoStatus;
};

export type TodoSort = {
    create_time?: SortField;
    done_time?: SortField;
};

export type ListInput = {
    session: Session;
    paging: Paging;
    filter?: TodoFilter;
    sort?: TodoSort;
};

export type ListOutput = {
    has_next: boolean;
    todos: Todo[];
};

export type CreateTodo = {
    title: string;
    description: string;
    status: TodoStatus;
    start_time: Date;
};

export type UpdateTodo = {
    id: TodoId;
    title?: string;
    description?: string;
    status?: TodoStatus;
};

export type CreateInput = {
    session: Session;
    create_todo: CreateTodo;
};

export type UpdateInput = {
    session: Session;
    update_todo: UpdateTodo;
};

export type DeleteInput = {
    session: Session;
    id: TodoId;
};

export type GetInput = {
    session: Session;
    id: TodoId;
};

export type GetOutput = {
    todo: Todo;
};