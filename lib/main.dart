import 'package:flutter/material.dart';
import './pages/LaunchPage.dart';
import './Application.dart';

void main() async {
  await Application().initAppAsync();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LaunchPage(),
    );
  }
}
