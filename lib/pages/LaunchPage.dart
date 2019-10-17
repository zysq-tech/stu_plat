import 'package:flutter/material.dart';
import '../Application.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    Application().initScreenUtil(context);
    return Scaffold(
      body: Container(),
    );
  }
}
