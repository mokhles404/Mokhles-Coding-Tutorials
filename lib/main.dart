import 'package:flutter/material.dart';
import 'package:fluttertuto/view/first_page.dart';
import 'package:fluttertuto/view/navigation_bar.dart';
import 'package:fluttertuto/view/second_page.dart';

import 'models/post.dart';
import 'modelview/service_modelview.dart';

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: BottomNavigationBarExample(),
    );
  }
}

