import 'package:fluro/fluro.dart';

import '../data/page_data.dart';

import '../pages/index.dart';

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

var editPhoneEmailHandler = Handler(
    handlerFunc: (_, params) => EditPhoneEmailPage(
          data: EditPhoneEmailPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var unregisterHandler = Handler(
    handlerFunc: (_, params) => UnregisterPage(
          data: UnregisterPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var helpCenterHandler = Handler(
    handlerFunc: (_, params) => HelpCenterPage(
          data: HelpCenterPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var feedbackHandler = Handler(
    handlerFunc: (_, params) => FeedbackPage(
          data: FeedbackPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var appDetailHandler = Handler(
    handlerFunc: (_, params) => AppDetailPage(
          data: AppDetailPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));

var webHandler = Handler(
    handlerFunc: (_, params) => WebPage(
          data: WebPageData.fromJson(
              jsonToObject(fluroCnParamsDecode(params['data'][0]))),
        ));
