import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './route_handlers.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String registerInfo = '/registerInfo';
  static String appealInfo = '/appealInfo';
  static String home = '/home';
  static String userInfo = '/userInfo';
  static String editPhoneEmail = '/editPhoneEmail';
  static String unregister = '/unregister';
  static String helpCenter = '/helpCenter';
  static String feedback = '/feedback';
  static String appDetail = '/appDetail';
  static String web = '/web';

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
    router.define(home, handler: homeHandler);
    router.define(userInfo, handler: userInfoHandler);
    router.define(editPhoneEmail, handler: editPhoneEmailHandler);
    router.define(unregister, handler: unregisterHandler);
    router.define(helpCenter, handler: helpCenterHandler);
    router.define(feedback, handler: feedbackHandler);
    router.define(appDetail, handler: appDetailHandler);
    router.define(web, handler: webHandler);
  }
}
