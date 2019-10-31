import 'package:json_annotation/json_annotation.dart';
import 'common.dart';

part 'user.g.dart';

@JsonSerializable(createFactory: false)
class Login implements IToJson {
  Login(this.userName, this.pwd, this.type);
  final String userName;
  final String pwd;

  ///类型1：个人/2团体
  final int type;

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable(createToJson: false)
class LoginResponse with CommonResponseMixin {
  LoginResponse(this.data);
  final LoginResponseData data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class LogoutResponse with CommonResponseMixin {
  LogoutResponse();

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class RequsetCode implements IToJson {
  RequsetCode(this.action, this.to);

  ///动作类型0:注册手机号验证/1:找回密码验证/2:手机号验证/3:支付密码验证 /20发送邮箱验证码
  final int action;

  ///手机号
  final String to;

  @override
  Map<String, dynamic> toJson() => _$RequsetCodeToJson(this);
}

@JsonSerializable(createToJson: false)
class RequsetCodeResponse with CommonResponseMixin {
  RequsetCodeResponse();

  factory RequsetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$RequsetCodeResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class VerifyCode implements IToJson {
  VerifyCode(this.action, this.type, this.code, this.to);

  ///动作类型0:注册手机号验证/1:找回密码验证/2:手机号验证/3:支付密码验证 /20发送邮箱验证码
  final int action;

  ///类型：sms短信/email邮箱
  ///defalut: sms
  final String type;
  final String code;

  ///手机号
  final String to;

  @override
  Map<String, dynamic> toJson() => _$VerifyCodeToJson(this);
}

@JsonSerializable(createToJson: false)
class VerifyCodeResponse with CommonResponseMixin {
  VerifyCodeResponse();

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class Register implements IToJson {
  Register(this.userTel, this.userPassword);
  final String userTel;
  final String userPassword;

  @override
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

@JsonSerializable(createToJson: false)
class RegisterResponse with CommonResponseMixin {
  RegisterResponse(this.data);
  final LoginResponseData data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class SetNickNameEmail implements IToJson {
  SetNickNameEmail(this.nickName, this.authEmail);
  @JsonKey(name: 'nikeName')
  final String nickName;
  final String authEmail;

  @override
  Map<String, dynamic> toJson() => _$SetNickNameEmailToJson(this);
}

@JsonSerializable(createToJson: false)
class SetNickNameEmailResponse with CommonResponseMixin {
  SetNickNameEmailResponse();

  factory SetNickNameEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SetNickNameEmailResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class RegisterUserInfo implements IToJson {
  RegisterUserInfo(this.userType, this.idfRealName, this.code,
      {this.schoolName, this.collegeName, this.className});

  ///身份:/1学生/2教师
  final int userType;
  final String idfRealName;
  @JsonKey(name: 'studentCode')
  final String code;
  final String schoolName;
  final String collegeName;
  final String className;

  @override
  Map<String, dynamic> toJson() => _$RegisterUserInfoToJson(this);
}

@JsonSerializable(createToJson: false)
class RegisterUserInfoResponse with CommonResponseMixin {
  ///code == 110:已存在认证或安全数据
  RegisterUserInfoResponse();

  factory RegisterUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetUserInfoResponse with CommonResponseMixin {
  GetUserInfoResponse(this.data);
  final UserInfoData data;

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UnregisterAccountResponse with CommonResponseMixin {
  UnregisterAccountResponse();

  factory UnregisterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UnregisterAccountResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class UpdatePassword implements IToJson {
  UpdatePassword(this.userName, this.userPassword);
  final String userName;
  final String userPassword;

  @override
  Map<String, dynamic> toJson() => _$UpdatePasswordToJson(this);
}

@JsonSerializable(createToJson: false)
class UpdatePasswordResponse with CommonResponseMixin {
  UpdatePasswordResponse();

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class AppealAccountResponse with CommonResponseMixin {
  AppealAccountResponse();

  factory AppealAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AppealAccountResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetAppealListResponse {
  GetAppealListResponse(this.data);
  final AppealListData data;

  factory GetAppealListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppealListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UpdateAvatarResponse with CommonResponseMixin {
  UpdateAvatarResponse();

  factory UpdateAvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAvatarResponseFromJson(json);
}

//Data
@JsonSerializable()
class LoginResponseData implements IToJson {
  LoginResponseData(this.token);
  final String token;

  @override
  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);
}

@JsonSerializable()
class UserInfoData with CommonTimeMixin implements IToJson {
  UserInfoData(
      this.userId,
      this.nickName,
      this.userName,
      this.userPassword,
      this.userTel,
      this.userType,
      this.authEmail,
      this.authEmailCreateTime,
      this.studentCode,
      this.schoolName,
      this.collegeName,
      this.className,
      this.isDelete,
      this.userStatus,
      this.idfStatus,
      this.infoStatus);
  final String userId;
  @JsonKey(name: 'nikeName')
  final String nickName;
  final String userName;
  final String userPassword;
  final String userTel;

  ///身份:/1学生/2教师/0:未注册信息
  final int userType;
  final String authEmail;
  final String authEmailCreateTime;
  final String studentCode;
  final String schoolName;
  final String collegeName;
  final String className;

  ///注销账号为true
  final bool isDelete;
  final bool userStatus;
  final int idfStatus;
  final int infoStatus;

  @override
  Map<String, dynamic> toJson() => _$UserInfoDataToJson(this);

  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);
}

@JsonSerializable()
class AppealListData with CommonPageInfoMixin implements IToJson {
  AppealListData(this.content);
  final List<AppealInfoData> content;

  @override
  Map<String, dynamic> toJson() => _$AppealListDataToJson(this);

  factory AppealListData.fromJson(Map<String, dynamic> json) =>
      _$AppealListDataFromJson(json);
}

@JsonSerializable()
class AppealInfoData with CommonTimeMixin implements IToJson {
  AppealInfoData(
      this.appealId,
      this.userId,
      this.userType,
      this.idfRealName,
      this.studentCode,
      this.schoolName,
      this.collegeName,
      this.className,
      this.userStatus,
      this.isDelete);
  final String appealId;
  final String userId;
  final int userType;
  final String idfRealName;
  final String studentCode;
  final String schoolName;
  final String collegeName;
  final String className;

  ///0:审核中;1:审核通过;2:审核失败
  final int userStatus;
  final bool isDelete;

  @override
  Map<String, dynamic> toJson() => _$AppealInfoDataToJson(this);

  factory AppealInfoData.fromJson(Map<String, dynamic> json) =>
      _$AppealInfoDataFromJson(json);
}
