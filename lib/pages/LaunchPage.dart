import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../Utils.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();

    var app = Application();
    app.appCompleter.future.then((_) {
      app.initSavedPreference(app.sp);
      print('app initialized');
      exitLaunchPage();
    });
  }

  void exitLaunchPage() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Application().router.navigateTo(
          context, '${Routes.login}?data=${objectToJson(LoginPageData())}',
          replace: true, transition: TransitionType.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    Application().initScreenUtil(context);
    return Scaffold(
      body: Center(
        child: Text('Launch Page'),
      ),
    );
  }
}
