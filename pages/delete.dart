import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/db.dart';
import 'package:flutter/material.dart';

class Delete extends StatelessWidget {
  Delete({super.key});
  final Db db = Db();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.getDocumentsStream(collectionName: "users"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          List<DocumentSnapshot> documents = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text(data['name']),
                subtitle: Text("${data['age']}"),
                trailing: IconButton(
                  onPressed: () {
                    db.deleteDocument(
                        collectionName: "users", documentId: documents[index].id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
