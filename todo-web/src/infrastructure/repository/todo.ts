import { CreateInput, DeleteInput, GetInput, GetOutput, ListInput, ListOutput, TodoRepository, UpdateInput } from "../../domain/repository/todo";

class TodoGrpcRepository implements TodoRepository {
    list(input: ListInput): ListOutput {
        throw new Error("Method not implemented.");
    }
    get(input: GetInput): GetOutput {
        throw new Error("Method not implemented.");
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
