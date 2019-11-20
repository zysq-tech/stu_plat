import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';

import './data/common.dart';
import './api/RestClient.dart';
import './api/DownloadClient.dart';
import './config/routes.dart';
import './Utils.dart';

export './config/routes.dart';
export './Constant.dart';
export './Utils.dart';

class Application {
  static Application _application;
  Application._();
  factory Application() => _application ??= Application._();

  SharedPreferences _sharedPreferences;

  SharedPreferences get sp => _sharedPreferences;

  Router _router = Router();

  Router get router => _router;

  ScreenUtil _screenUtil;

  ScreenUtil get screenUtil => _screenUtil;

  RestClient _restClient;

  RestClient get restClient => _restClient;

  DownloadClient _downloadClient;

  DownloadClient get downloadClient => _downloadClient;

  Completer<Application> appCompleter = Completer<Application>();

  Future<void> initAppAsync() async {
    Dio dio = Dio();
    _restClient = RestClient(dio);
    _downloadClient = DownloadClient(dio);
    Routes.configureRoutes(_router);
    ScreenUtil.instance = _screenUtil = ScreenUtil(width: 1080, height: 1920);
    _sharedPreferences = await SharedPreferences.getInstance();
    appCompleter.complete(this);
  }

  void initSavedPreference(SharedPreferences sharedPreferences) {
    //TODO: get saved objects
  }

  void initScreenUtil(BuildContext context) {
    _screenUtil.init(context);
  }

  Future<dynamic> navigateTo(
    BuildContext context,
    String route,
    IToJson dataParam, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.cupertino,
  }) {
    String dataStr = fluroCnParamsEncode(objectToJson(dataParam));
    return router.navigateTo(context, '$route?data=$dataStr',
        replace: replace, clearStack: clearStack, transition: transition);
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
