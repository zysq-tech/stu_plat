import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

import './data/common.dart';
import './api/RestClient.dart';

class Application {
  static Application _application;
  Application._();
  factory Application() => _application ??= Application._();

  SharedPreferences _sharedPreferences;

  SharedPreferences get sp => _sharedPreferences;

  Router _router;

  Router get router => _router;

  ScreenUtil _screenUtil;

  ScreenUtil get screenUtil => _screenUtil;

  RestClient _restClient;

  RestClient get restClient => _restClient;

  Completer<Application> appCompleter = Completer<Application>();

  Future<void> initAppAsync() async {
    _restClient = RestClient(Dio());
    _router = Router();
    configRoutes(_router);
    ScreenUtil.instance = _screenUtil = ScreenUtil(width: 750, height: 1334);
    _sharedPreferences = await SharedPreferences.getInstance();
    appCompleter.complete(this);
  }

  void initSavedPreference(SharedPreferences sharedPreferences) {
    //TODO: get saved objects
  }

  void initScreenUtil(BuildContext context) {
    _screenUtil.init(context);
  }

  void configRoutes(Router router) {
    // router.notFoundHandler = Handler(
    //     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    //   print('>>>ROUTE NOT FOUND!!!<<<');
    // });
    // router.define('routePath');
  }
}

// dioErrorWrapper(_restClient.logout('token')).then((onValue) {
//   handleCommonResponse(onValue);
// });

Future<T> dioErrorWrapper<T>(Future<T> future) {
  return future.catchError((Object obj) {
    // non-200 error goes here.
    switch (obj.runtimeType) {
      case DioError:
        // Here's the sample to get the failed response error code and message
        final res = (obj as DioError).response;
        print('Got error : ${res.statusCode} -> ${res.statusMessage}');
        break;
      default:
    }
  });
}

bool handleCommonResponse(CommonResponseMixin response,
    {List<int> normalCode = const [200]}) {
  if (normalCode.any((code) => code == response.code)) {
    return true;
  }
  //Error
  return false;
}
