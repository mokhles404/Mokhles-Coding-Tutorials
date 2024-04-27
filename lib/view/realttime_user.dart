


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class UserListPage extends StatelessWidget {
   UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),

        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {

          List<DocumentSnapshot> users = snapshot.data.docs;

          if (users.isEmpty) {
            return Center(
              child: Text('No users found'),
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              Map<String,dynamic>? userData = users[index].data() as Map<String,dynamic>;

              return Text(userData['email']);
            },
          );

        },),
    );
  }
}
