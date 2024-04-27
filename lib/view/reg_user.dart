import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class RegisterUser extends StatelessWidget {
   RegisterUser({super.key});

   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _phoneController = TextEditingController();


   Future<void> _registerUser() async {

       // FirebaseFirestore.instance.collection('users').doc(_emailController.text.trim()).set(
       //     {
       //       'name': _nameController.text.trim(),
       //       'email': _emailController.text.trim(),
       //       'phone': _phoneController.text.trim(),
       //     }
       // );

     QuerySnapshot<Map<String, dynamic>> users = await FirebaseFirestore.instance.collection('users').get();

     print(users.docs.first.data());

   }


   Future<void> deleteUserByEmail(String email) async {
     try {
       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
           .collection('users')
           .where('name', isEqualTo: email)
           .get();

       if (querySnapshot.docs.isNotEmpty) {
         // If user with the provided email exists, delete it
         final doc = querySnapshot.docs.first;
         await doc.reference.delete();
         print('User with email $email deleted successfully');
       } else {
         print('User with email $email not found');
       }
     } catch (error) {
       print('Error deleting user: $error');
     }
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),

            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),

            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),

            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
               await deleteUserByEmail(_emailController.text);
              },
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
