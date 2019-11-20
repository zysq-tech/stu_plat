import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../data/page_data.dart';

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
      Application().navigateTo(context, Routes.login, LoginPageData(),
          replace: true, transition: TransitionType.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    Application().initScreenUtil(context);
    ScreenUtil su = Application().screenUtil;
    return Scaffold(
      body: Center(
        child: Container(
          width: su.setWidth(320),
          height: su.setWidth(320),
          decoration: BoxDecoration(image: getDefaultIcon()),
        ),
      ),
    );
  }
}
