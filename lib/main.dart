import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './Application.dart';
import './providers/index.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: mainThemeColor,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    Application().initAppAsync();
    runApp(MyApp());
  });
}

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
        onGenerateRoute: Application().router.generator,
      ),
    );
  }
}
