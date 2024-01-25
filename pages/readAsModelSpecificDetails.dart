// ignore_for_file: file_names

import 'package:crud/db.dart';
import 'package:crud/model/user.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final String docid;

  UserDetailPage({super.key, required this.docid});

  final Db db = Db();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: StreamBuilder(
        stream: db.getDocumentAsModelStream(
            collectionName: "users", documentId: docid, fromMap: User.fromMap),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          User? user = snapshot.data;

          if (user == null) {
            return const Center(child: Text('User not found'));
          }

          return ListTile(
            title: Text("Name: ${user.name}"),
            subtitle: Text("Age: ${user.age}"),
          );
        },
      ),
    );
  }
}
