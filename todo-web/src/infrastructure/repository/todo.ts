import { CreateInput, DeleteInput, GetInput, GetOutput, ListInput, ListOutput, TodoRepository, UpdateInput } from "../../domain/repository/todo";
import { TodoRpcClient } from "../grpc/proto_ts_gen/todo/TodoServiceClientPb";
import * as grpc from "../grpc/proto_ts_gen/todo/todo_pb";
import { toGrpcSession } from "./converter/authentication";
import { toGrpcPaging } from "./converter/list";
import { toGrpcTodoFilter, toGrpcTodoId, toGrpcTodoSort, toTodo, toTodos } from "./converter/todo";

export class TodoGrpcRepository implements TodoRepository {
    client: TodoRpcClient;
    constructor(client: TodoRpcClient) {
        this.client = client;
    }

    async list(input: ListInput): Promise<ListOutput> {
        const grpcInput = new grpc.ListInput();
        grpcInput.setSession(toGrpcSession(input.session));
        grpcInput.setPaging(toGrpcPaging(input.paging));

        if (input.filter) {
            grpcInput.setFilter(toGrpcTodoFilter(input.filter));
        }

        if (input.sort) {
            grpcInput.setSort(toGrpcTodoSort(input.sort));
        }

        const result = await this.client.list(grpcInput, null);
        return {
            todos: toTodos(result.getTodosList()),
            has_next: result.getHasNext(),
        };
    }


    async get(input: GetInput): Promise<GetOutput> {
        const grpcTodoId = toGrpcTodoId(input.id);
        const grpcSession = toGrpcSession(input.session);
        const grpcInput = new grpc.GetInput();
        grpcInput.setId(grpcTodoId);
        grpcInput.setSession(grpcSession);

        const result = await this.client.get(grpcInput, null);
        return {
            todo: toTodo(result.getTodo()!),
        };
    }
    create(input: CreateInput): void {
        throw new Error("Method not implemented.");
    }
    update(input: UpdateInput): void {
        throw new Error("Method not implemented.");
    }
    delete(input: DeleteInput): void {
        throw new Error("Method not implemented.");
    }

};
