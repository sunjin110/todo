import 'package:flutter/material.dart';
import 'package:todoapp/application/todo.dart';
import 'package:todoapp/presenter/todo_add.dart';

class TodoListPage extends StatefulWidget {
  final TodoUseCase todoUseCase;

  TodoListPage(this.todoUseCase);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    // widget.todoUseCase.list(0, 100);

    return Scaffold(
      appBar: AppBar(
        title: Text("リスト一覧"),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? todoText = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));

          if (todoText == null) {
            return;
          }
          setState(() {
            todoList.add(todoText);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
