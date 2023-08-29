import 'package:logger/logger.dart';
import 'package:todoapp/application/application.dart';
import 'package:todoapp/application/error.dart';
import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/domain/model/user_auth.dart';
import 'package:todoapp/domain/repository/error.dart';
import 'package:todoapp/domain/repository/repository.dart';
import 'package:todoapp/domain/repository/todo.dart';
import 'package:todoapp/domain/service/authentication.dart';

abstract interface class TodoUseCase {
  Future<TodoListOutput> list(DateTime txTime, int offset, int limit);
  Future<Todo> get(TodoId id, DateTime txTime);
  Future<void> add(
      DateTime txTime, String title, String description, DateTime? startTime);
  Future<void> update(TodoId id, DateTime txTime, String? title,
      String? description, TodoStatus? status);
  Future<void> delete(TodoId id, DateTime txTime);
}

TodoUseCase newTodoUseCase(TodoRepository todoRepository,
    AuthenticationService authenticationService) {
  return _TodoUseCase(todoRepository, authenticationService);
}

class _TodoUseCase extends BaseUseCase implements TodoUseCase {
  final TodoRepository _todoRepository;
  final Logger logger = Logger();
  _TodoUseCase(
      this._todoRepository, AuthenticationService authenticationService)
      : super(authenticationService);

  @override
  Future<TodoListOutput> list(DateTime txTime, int offset, int limit) async {
    final session = await localVerification(txTime);

    try {
      final output = await _todoRepository.list(ListInput(
          session: session, paging: Paging(offset: offset, limit: limit)));
      return TodoListOutput(hasNext: output.hasNext, list: output.todos);
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed get todo list");
    }
  }

  @override
  Future<Todo> get(TodoId id, DateTime txTime) async {
    final Session session = await localVerification(txTime);

    try {
      return await _todoRepository.get(session, id);
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed get todo");
    }
  }

  @override
  Future<void> add(DateTime txTime, String title, String description,
      DateTime? startTime) async {
    final Session session = await localVerification(txTime);

    try {
      await _todoRepository.create(
          session,
          CreateTodo(
            title: title,
            description: description,
            status: TodoStatus.scheduled,
            startTime: startTime,
          ));
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed add todo");
    }
  }

  @override
  Future<void> update(TodoId id, DateTime txTime, String? title,
      String? description, TodoStatus? status) async {
    final Session session = await localVerification(txTime);

    try {
      await _todoRepository.update(
          session,
          UpdateTodo(
              id: id, title: title, description: description, status: status));
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed update todo");
    }
  }

  @override
  Future<void> delete(TodoId id, DateTime txTime) async {
    final Session session = await localVerification(txTime);

    try {
      await _todoRepository.delete(session, id);
    } catch (e) {
      throw defaultUseCaseErrorHandling(e, "failed delete todo");
    }
  }
}

class TodoListOutput {
  final bool hasNext;
  final List<Todo> list;
  TodoListOutput({required this.hasNext, required this.list});
}
