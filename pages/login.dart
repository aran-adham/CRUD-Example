// ignore_for_file: must_be_immutable

import 'package:crud/db.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Db db = Db();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),

            ElevatedButton(
              onPressed: () {
                db.login(email.text, password.text);
                Navigator.pop(context);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}