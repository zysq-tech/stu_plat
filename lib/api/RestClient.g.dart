// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = 'http://www.zhiyuantech.net/api/';
  }

  final Dio _dio;

  @override
  login(loginBody) async {
    ArgumentError.checkNotNull(loginBody, 'loginBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = loginBody;
    final _result = await _dio.request('/session',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = LoginResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  logout(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    const _data = null;
    final _result = await _dio.request('/session',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'DELETE', headers: {}, extra: _extra),
        data: _data);
    var value = LogoutResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  requestCode(requsetCodeBody) async {
    ArgumentError.checkNotNull(requsetCodeBody, 'requsetCodeBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = requsetCodeBody;
    final _result = await _dio.request('/rest/sendCode',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = RequsetCodeResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  verifyCode(verifyCodeBody) async {
    ArgumentError.checkNotNull(verifyCodeBody, 'verifyCodeBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = verifyCodeBody;
    final _result = await _dio.request('/rest/verifyCode',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = VerifyCodeResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  register(registerBody) async {
    ArgumentError.checkNotNull(registerBody, 'registerBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = registerBody;
    final _result = await _dio.request('/rest/register',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = RegisterResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  setNickNameEmail(token, setNickNameEmailBody) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(setNickNameEmailBody, 'setNickNameEmailBody');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'token': token};
    final _data = setNickNameEmailBody;
    final _result = await _dio.request('/nickemail',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'PUT', headers: {}, extra: _extra),
        data: _data);
    var value = SetNickNameEmailResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppInfoPage(searchType, pageSize) async {
    ArgumentError.checkNotNull(searchType, 'searchType');
    ArgumentError.checkNotNull(pageSize, 'pageSize');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(pageSize ?? {});
    const _data = null;
    final _result = await _dio.request('/appInfo/rest/$searchType',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: {}, extra: _extra),
        data: _data);
    var value = GetAppInfoPageResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppBestList(searchType) async {
    ArgumentError.checkNotNull(searchType, 'searchType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    const _data = null;
    final _result = await _dio.request('/appInfo/rest/list/$searchType',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: {}, extra: _extra),
        data: _data);
    var value = GetAppBestListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getAppDetail(appId) async {
    ArgumentError.checkNotNull(appId, 'appId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    const _data = null;
    final _result = await _dio.request('/appInfo/rest/detail/$appId',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'GET', headers: {}, extra: _extra),
        data: _data);
    var value = GetAppDetailResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
