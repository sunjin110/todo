import 'package:flutter/material.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/domain/model/todo.dart';
import 'package:todoapp/presenter/todo_add.dart';

class TodoListPage extends StatefulWidget {
  final TodoUseCase todoUseCase;

  TodoListPage(this.todoUseCase);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late Future<TodoListOutput> todoListData;

  @override
  void initState() {
    super.initState();
    todoListData = Future<TodoListOutput>(() async {
      return await widget.todoUseCase.list(0, 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todoListData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return _TodoListPageState.page(context, []);
            case ConnectionState.waiting:
              return _TodoListPageState.page(context, []);
            case ConnectionState.active:
              return _TodoListPageState.page(context, []);
            case ConnectionState.done:
              final List<Todo> todoList =
                  snapshot.data != null ? snapshot.data!.list : [];
              return _TodoListPageState.page(context, todoList);
          }
        });
  }

  static Widget page(BuildContext context, List<Todo> todoList) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト一覧"),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index].title),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? todoText = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));

          if (todoText == null) {
            return;
          }

          print("todo 追加、まあリフレッシュでいいと思う");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
