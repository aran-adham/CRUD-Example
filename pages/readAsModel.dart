// ignore_for_file: must_be_immutable, file_names

import 'package:crud/db.dart';
import 'package:crud/pages/readAsModelSpecificDetails.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class ReadAsModel extends StatefulWidget {
  const ReadAsModel({super.key});

  @override
  State<ReadAsModel> createState() => _ReadAsModelState();
}

class _ReadAsModelState extends State<ReadAsModel> {
  Db db = Db();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.getDocumentsAsModelsStream<User>(
          collectionName: 'users',
          fromMap: (documentId, data) => User.fromMap(documentId, data),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          List<User> users = snapshot.data ?? [];

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              User user = users[index];

              return ListTile(
                title: Text('Name: ${user.name}'),
                subtitle: Text('Age: ${user.age}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailPage(docid: user.id),
                      ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
