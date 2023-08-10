import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン画面"),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "email"),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(labelText: "password"),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                onPressed: () {
                  print("TODO login...");
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
