// ignore_for_file: must_be_immutable

import 'package:crud/db.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Db db = Db();
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                db.register(email.text, password.text);
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
