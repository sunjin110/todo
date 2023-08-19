import 'package:flutter/material.dart';
import 'package:todoapp/application/todo.dart';

class TodoAddPage extends StatefulWidget {
  final TodoUseCase todoUseCase;

  TodoAddPage(this.todoUseCase);

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト追加画面"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () async {
                  await widget.todoUseCase
                      .add(DateTime.now(), _title, _description);

                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "リスト追加",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black12)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("キャンセル"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
