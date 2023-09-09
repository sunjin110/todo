import { CreateInput, DeleteInput, GetInput, GetOutput, ListInput, ListOutput, TodoRepository, UpdateInput } from "../../domain/repository/todo";
import { TodoRpcClient } from "../grpc/proto_ts_gen/todo/TodoServiceClientPb";
import * as grpc from "../grpc/proto_ts_gen/todo/todo_pb";
import { toGrpcSession } from "./converter/authentication";
import { toGrpcPaging } from "./converter/list";
import { toGrpcCreateTodo, toGrpcTodoFilter, toGrpcTodoId, toGrpcTodoSort, toGrpcUpdateTodo, toTodo, toTodos } from "./converter/todo";

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
    
    async create(input: CreateInput): Promise<void> {
        const grpcInput = new grpc.CreateInput();
        grpcInput.setSession(toGrpcSession(input.session));
        grpcInput.setTodo(toGrpcCreateTodo(input.create_todo));
        await this.client.create(grpcInput, null);
    }
    async update(input: UpdateInput): Promise<void> {
        const grpcInput = new grpc.UpdateInput();
        grpcInput.setSession(toGrpcSession(input.session));
        grpcInput.setTodo(toGrpcUpdateTodo(input.update_todo));
        await this.client.update(grpcInput, null);
    }
    async delete(input: DeleteInput): Promise<void> {
        const gInput = new grpc.DeleteInput();
        gInput.setSession(toGrpcSession(input.session));
        gInput.setId(toGrpcTodoId(input.id));
        await this.client.delete(gInput, null);
    }
};
