import 'package:fluro/fluro.dart';

import '../pages/LaunchPage.dart';
import '../pages/LoginPage.dart';

var launchHandler = Handler(handlerFunc: (_, p) => LaunchPage());

var loginHandler = Handler(handlerFunc: (context, params) => LoginPage());
