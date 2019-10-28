// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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

Map<String, dynamic> _$RegisterUserInfoToJson(RegisterUserInfo instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'idfRealName': instance.idfRealName,
      'studentCode': instance.code,
      'schoolName': instance.schoolName,
      'collegeName': instance.collegeName,
      'className': instance.className,
    };

RegisterUserInfoResponse _$RegisterUserInfoResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterUserInfoResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetUserInfoResponse _$GetUserInfoResponseFromJson(Map<String, dynamic> json) {
  return GetUserInfoResponse(
    json['data'] == null
        ? null
        : UserInfoData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

UnregisterAccountResponse _$UnregisterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return UnregisterAccountResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$UpdatePasswordToJson(UpdatePassword instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userPassword': instance.userPassword,
    };

UpdatePasswordResponse _$UpdatePasswordResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePasswordResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$AppealAccountToJson(AppealAccount instance) =>
    <String, dynamic>{
      'idfRealName': instance.idfRealName,
      'studentCode': instance.studentCode,
      'schoolName': instance.schoolName,
      'collegeName': instance.collegeName,
      'className': instance.className,
      'userType': instance.userType,
    };

AppealAccountResponse _$AppealAccountResponseFromJson(
    Map<String, dynamic> json) {
  return AppealAccountResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetAppealListResponse _$GetAppealListResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppealListResponse(
    json['data'] == null
        ? null
        : AppealListData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

UpdateAvatarResponse _$UpdateAvatarResponseFromJson(Map<String, dynamic> json) {
  return UpdateAvatarResponse()
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

UserInfoData _$UserInfoDataFromJson(Map<String, dynamic> json) {
  return UserInfoData(
    json['userId'] as String,
    json['nikeName'] as String,
    json['userName'] as String,
    json['userPassword'] as String,
    json['userTel'] as String,
    json['userType'] as int,
    json['authEmail'] as String,
    json['authEmailCreateTime'] as String,
    json['studentCode'] as String,
    json['schoolName'] as String,
    json['collegeName'] as String,
    json['className'] as String,
    json['isDelete'] as bool,
    json['userStatus'] as bool,
    json['idfStatus'] as int,
    json['infoStatus'] as int,
  )
    ..createtime = json['createtime'] as String
    ..updateTime = json['updateTime'] as String;
}

Map<String, dynamic> _$UserInfoDataToJson(UserInfoData instance) =>
    <String, dynamic>{
      'createtime': instance.createtime,
      'updateTime': instance.updateTime,
      'userId': instance.userId,
      'nikeName': instance.nickName,
      'userName': instance.userName,
      'userPassword': instance.userPassword,
      'userTel': instance.userTel,
      'userType': instance.userType,
      'authEmail': instance.authEmail,
      'authEmailCreateTime': instance.authEmailCreateTime,
      'studentCode': instance.studentCode,
      'schoolName': instance.schoolName,
      'collegeName': instance.collegeName,
      'className': instance.className,
      'isDelete': instance.isDelete,
      'userStatus': instance.userStatus,
      'idfStatus': instance.idfStatus,
      'infoStatus': instance.infoStatus,
    };

AppealListData _$AppealListDataFromJson(Map<String, dynamic> json) {
  return AppealListData(
    (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : AppealInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..first = json['first'] as bool
    ..last = json['last'] as bool
    ..totalElements = json['totalElements'] as int
    ..totalPages = json['totalPages'] as int
    ..numberOfElements = json['numberOfElements'] as int
    ..size = json['size'] as int
    ..number = json['number'] as int;
}

Map<String, dynamic> _$AppealListDataToJson(AppealListData instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'number': instance.number,
      'content': instance.content,
    };

AppealInfoData _$AppealInfoDataFromJson(Map<String, dynamic> json) {
  return AppealInfoData(
    json['appealId'] as String,
    json['userId'] as String,
    json['userType'] as int,
    json['idfRealName'] as String,
    json['studentCode'] as String,
    json['schoolName'] as String,
    json['collegeName'] as String,
    json['className'] as String,
    json['userStatus'] as int,
    json['isDelete'] as bool,
  )
    ..createtime = json['createtime'] as String
    ..updateTime = json['updateTime'] as String;
}

Map<String, dynamic> _$AppealInfoDataToJson(AppealInfoData instance) =>
    <String, dynamic>{
      'createtime': instance.createtime,
      'updateTime': instance.updateTime,
      'appealId': instance.appealId,
      'userId': instance.userId,
      'userType': instance.userType,
      'idfRealName': instance.idfRealName,
      'studentCode': instance.studentCode,
      'schoolName': instance.schoolName,
      'collegeName': instance.collegeName,
      'className': instance.className,
      'userStatus': instance.userStatus,
      'isDelete': instance.isDelete,
    };
