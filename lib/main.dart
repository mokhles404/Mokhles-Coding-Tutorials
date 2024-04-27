import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/view/realttime_user.dart';
import 'package:firebaseapp/view/reg_user.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seance 5',

      home: UserListPage(),

    );
  }
}
