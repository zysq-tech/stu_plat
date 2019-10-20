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
