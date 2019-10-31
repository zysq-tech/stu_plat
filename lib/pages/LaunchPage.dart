import 'package:flutter/material.dart';
import '../Application.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();

    var app = Application();
    app.initAppAsync().then((_) {
      app.initSavedPreference(app.sp);
      print('app initialized');
      exitLaunchPage();
    });
  }

  void exitLaunchPage() {}

  @override
  Widget build(BuildContext context) {
    Application().initScreenUtil(context);
    return Scaffold(
      body: Container(
        child: Text('Launch Page'),
      ),
    );
  }
}
