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
    todoListData = _list();
  }

  Future<TodoListOutput> _list() async {
    return await widget.todoUseCase.list(DateTime.now(), 0, 100);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: todoListData,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return page(context, []);
            case ConnectionState.waiting:
              return page(context, []);
            case ConnectionState.active:
              return page(context, []);
            case ConnectionState.done:
              final List<Todo> todoList =
                  snapshot.data != null ? snapshot.data!.list : [];
              return page(context, todoList);
          }
        });
  }

  Widget page(BuildContext context, List<Todo> todoList) {
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
                subtitle: Text(todoList[index].description),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final bool isAdded = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage(widget.todoUseCase);
          }));

          if (!isAdded) {
            return;
          }

          setState(() {
            todoListData = _list();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
