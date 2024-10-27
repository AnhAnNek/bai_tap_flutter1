import 'package:flutter/material.dart';
import 'screens/introduction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroductionPage(),
    );
  }
}
