// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'userName': instance.userName,
      'pwd': instance.pwd,
      'type': instance.type,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    json['data'] == null
        ? null
        : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

LoginResponseData _$LoginResponseDataFromJson(Map<String, dynamic> json) {
  return LoginResponseData(
    json['token'] as String,
  );
}

Map<String, dynamic> _$LoginResponseDataToJson(LoginResponseData instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$RequsetCodeToJson(RequsetCode instance) =>
    <String, dynamic>{
      'action': instance.action,
      'to': instance.to,
    };

RequsetCodeResponse _$RequsetCodeResponseFromJson(Map<String, dynamic> json) {
  return RequsetCodeResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$VerifyCodeToJson(VerifyCode instance) =>
    <String, dynamic>{
      'action': instance.action,
      'type': instance.type,
      'code': instance.code,
      'to': instance.to,
    };

VerifyCodeResponse _$VerifyCodeResponseFromJson(Map<String, dynamic> json) {
  return VerifyCodeResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'userTel': instance.userTel,
      'userPassword': instance.userPassword,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    json['data'] == null
        ? null
        : LoginResponseData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$SetNickNameEmailToJson(SetNickNameEmail instance) =>
    <String, dynamic>{
      'nikeName': instance.nickName,
      'authEmail': instance.authEmail,
    };

SetNickNameEmailResponse _$SetNickNameEmailResponseFromJson(
    Map<String, dynamic> json) {
  return SetNickNameEmailResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}
