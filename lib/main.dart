import 'package:flutter/material.dart';

import './pages/LaunchPage.dart';
import './providers/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppProvider().initProvider(
      context: context,
      child: MaterialApp(
        title: 'Student Platform',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            appBarTheme: AppBarTheme(color: Colors.white, elevation: 1)),
        home: LaunchPage(),
      ),
    );
  }
}
