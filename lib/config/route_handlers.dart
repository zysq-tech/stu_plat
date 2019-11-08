import 'package:fluro/fluro.dart';

import '../data/page_data.dart';

import '../pages/LaunchPage.dart';
import '../pages/LoginPage.dart';
import '../pages/RegisterInfoPage.dart';
import '../pages/AppealPage.dart';

import '../Utils.dart';

var launchHandler = Handler(handlerFunc: (_, p) => LaunchPage());

var loginHandler = Handler(
    handlerFunc: (context, params) => LoginPage(
          data: LoginPageData.fromJson(jsonToObject(params['data'][0])),
        ));

var registerInfoHandler = Handler(
    handlerFunc: (context, params) => RegisterInfoPage(
          data: RegisterInfoPageData.fromJson(jsonToObject(params['data'][0])),
        ));

var appealInfoHandler = Handler(
    handlerFunc: (_, params) => AppealPage(
          data: AppealPageData.fromJson(jsonToObject(params['data'][0])),
        ));
