import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

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
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(
              height: 8,
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
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
                onPressed: () {
                  Navigator.of(context).pop(_text);
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
                  Navigator.of(context).pop();
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
