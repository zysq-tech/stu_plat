import 'package:flutter/material.dart';

import './pages/LaunchPage.dart';
import './Application.dart';
import './providers/index.dart';

void main() async {
  await Application().initAppAsync();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppProvider().initProvider(
      context: context,
      child: MaterialApp(
        title: 'Student Platform',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LaunchPage(),
      ),
    );
  }
}
