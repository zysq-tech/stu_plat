import 'package:fluro/fluro.dart';

import '../pages/LaunchPage.dart';
import '../pages/LoginPage.dart';
import '../pages/RegisterInfoPage.dart';

var launchHandler = Handler(handlerFunc: (_, p) => LaunchPage());

var loginHandler = Handler(handlerFunc: (context, params) => LoginPage());

var registerInfoHandler = Handler(
    handlerFunc: (context, params) => RegisterInfoPage(
          type: int.parse(params['type'][0]),
        ));
