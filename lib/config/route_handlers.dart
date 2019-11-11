import 'package:fluro/fluro.dart';

import '../data/page_data.dart';

import '../pages/LaunchPage.dart';
import '../pages/LoginPage.dart';
import '../pages/RegisterInfoPage.dart';
import '../pages/AppealPage.dart';
import '../pages/HomePage.dart';
import '../pages/UserInfoPage.dart';

import '../Utils.dart';

var launchHandler = Handler(handlerFunc: (_, p) => LaunchPage());

var loginHandler = Handler(
    handlerFunc: (context, params) => LoginPage(
          data: LoginPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var registerInfoHandler = Handler(
    handlerFunc: (context, params) => RegisterInfoPage(
          data: RegisterInfoPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var appealInfoHandler = Handler(
    handlerFunc: (_, params) => AppealPage(
          data: AppealPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var homeHandler = Handler(
    handlerFunc: (_, params) => HomePage(
          data: HomePageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var userInfoHandler = Handler(
    handlerFunc: (_, params) => UserInfoPage(
          data: UserInfoPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));
