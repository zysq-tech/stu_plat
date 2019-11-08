import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String registerInfo = '/registerInfo';
  static String appealInfo = '/appealInfo';
  static String home = '/home';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('>>>ROUTE NOT FOUND!!!<<<');
      },
    );

    router.define(root, handler: launchHandler);
    router.define(login, handler: loginHandler);
    router.define(registerInfo, handler: registerInfoHandler);
    router.define(appealInfo, handler: appealInfoHandler);
  }
}
