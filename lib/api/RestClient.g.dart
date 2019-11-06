// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'http://www.zhiyuantech.net/api/';

  @override
  login(loginBody) async {
    ArgumentError.checkNotNull(loginBody, 'loginBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(loginBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/session',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  logout(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/session',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LogoutResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  requestCode(requsetCodeBody) async {
    ArgumentError.checkNotNull(requsetCodeBody, 'requsetCodeBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(requsetCodeBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/rest/sendCode',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RequsetCodeResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  verifyCode(verifyCodeBody) async {
    ArgumentError.checkNotNull(verifyCodeBody, 'verifyCodeBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyCodeBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/rest/verifyCode',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCodeResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  register(registerBody) async {
    ArgumentError.checkNotNull(registerBody, 'registerBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/rest/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  unregisterAccount(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/logout',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UnregisterAccountResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  setNickNameEmail(token, setNickNameEmailBody) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(setNickNameEmailBody, 'setNickNameEmailBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    _data.addAll(setNickNameEmailBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/nickemail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SetNickNameEmailResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  registerUserInfo(token, registerUserInfoBody) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(registerUserInfoBody, 'registerUserInfoBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    _data.addAll(registerUserInfoBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/info',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterUserInfoResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updatePassword(updatePasswordBody) async {
    ArgumentError.checkNotNull(updatePasswordBody, 'updatePasswordBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updatePasswordBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/rest/updatePwd',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdatePasswordResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  appealAccount(token, file, userType, studentCode, idfRealName, schoolName,
      {collegeName, className}) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(file, 'file');
    ArgumentError.checkNotNull(userType, 'userType');
    ArgumentError.checkNotNull(studentCode, 'studentCode');
    ArgumentError.checkNotNull(idfRealName, 'idfRealName');
    ArgumentError.checkNotNull(schoolName, 'schoolName');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = FormData.fromMap(<String, dynamic>{
      'file': MultipartFile.fromFile(file.path,
          filename: file.path.split(Platform.pathSeparator).last),
      'userType': userType,
      'studentCode': studentCode,
      'idfRealName': idfRealName,
      'schoolName': schoolName,
      'collegeName': collegeName,
      'className': className
    });
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userAppeal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AppealAccountResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppealList(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userAppeal',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppealListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updateAvatar(token, file) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = FormData.fromMap(<String, dynamic>{
      'file': MultipartFile.fromFile(file.path,
          filename: file.path.split(Platform.pathSeparator).last)
    });
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/updateAvatar',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UpdateAvatarResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  verifyCodeAndRealName(token, verifyCodeBody) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(verifyCodeBody, 'verifyCodeBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    _data.addAll(verifyCodeBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCodeAndRealNameResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getInAppNewsPage(token, getInAppNewsQueries) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(getInAppNewsQueries, 'getInAppNewsQueries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    queryParameters.addAll(getInAppNewsQueries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appUserNews/pageList',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetInAppNewsResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  readInAppNews(userNewId, token) async {
    ArgumentError.checkNotNull(userNewId, 'userNewId');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appUserNews/isRead/$userNewId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ReadInAppNewsResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getLeaderBoardAppPage(searchType, getLeaderBoardAppPageQueries) async {
    ArgumentError.checkNotNull(searchType, 'searchType');
    ArgumentError.checkNotNull(
        getLeaderBoardAppPageQueries, 'getLeaderBoardAppPageQueries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(getLeaderBoardAppPageQueries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appInfo/rest/$searchType',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetLeaderBoardAppPageResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppBestList(searchType) async {
    ArgumentError.checkNotNull(searchType, 'searchType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appInfo/rest/list/$searchType',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppBestListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppDetail(appId) async {
    ArgumentError.checkNotNull(appId, 'appId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appInfo/rest/detail/$appId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppDetailResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  commentApp(token, commentAppBody) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(commentAppBody, 'commentAppBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    _data.addAll(commentAppBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userAppraise',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommentAppResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppCommentPage(token, getUserAppCommentsPage) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(
        getUserAppCommentsPage, 'getUserAppCommentsPage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    queryParameters.addAll(getUserAppCommentsPage ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userAppraise/pageList',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetUserAppCommentsPageResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppLabelList(getAppLabelListQueries) async {
    ArgumentError.checkNotNull(
        getAppLabelListQueries, 'getAppLabelListQueries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(getAppLabelListQueries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appLabel/rest/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppLabelListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppPageWithLabel(labelId, getAppPageWithLabelQueries) async {
    ArgumentError.checkNotNull(labelId, 'labelId');
    ArgumentError.checkNotNull(
        getAppPageWithLabelQueries, 'getAppPageWithLabelQueries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(getAppPageWithLabelQueries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appLabelRelation/rest/$labelId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppPageWithLabelResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getChoosenAppList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appChoose/rest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetChoosenAppListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getHomeTagList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/mainTitle/rest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetHomeTagListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getHomeTaggedAppList(mainId) async {
    ArgumentError.checkNotNull(mainId, 'mainId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/mainTitle/rest/$mainId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetHomeTaggedAppListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAllTabList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appTab/rest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetTabListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getUserInfo(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetUserInfoResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppCommentList(appId, getAppCommentListBody) async {
    ArgumentError.checkNotNull(appId, 'appId');
    ArgumentError.checkNotNull(getAppCommentListBody, 'getAppCommentListBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(getAppCommentListBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/userAppraise/rest/pageList/$appId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAppCommentListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getLatestVersion() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appVersion/rest/newest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetLatestVersionResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAllQuestionTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appQuestion/rest/typelist',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAllQuestionTypesResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  postUserQuestion(postUserQuestionBody) async {
    ArgumentError.checkNotNull(postUserQuestionBody, 'postUserQuestionBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(postUserQuestionBody.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/appQuestion/rest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PostUserQuestionResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
