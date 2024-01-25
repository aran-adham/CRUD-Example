import 'package:crud/db.dart';
import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  Create({super.key});
  final TextEditingController field1 = TextEditingController();
  final TextEditingController field2 = TextEditingController();
  final Db db = Db();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: field1,
          ),
          TextField(
            controller: field2,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> data = {
                'name': field1.text,
                'age': int.parse(field2.text),
                'imageURL': '',
              };
              db.addDocument(collectionName: "users", data: data);
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }
}
