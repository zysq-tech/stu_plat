import 'package:json_annotation/json_annotation.dart';

import 'common.dart';

part 'page_data.g.dart';

@JsonSerializable()
class LoginPageData implements IToJson {
  LoginPageData();

  @override
  Map<String, dynamic> toJson() => _$LoginPageDataToJson(this);

  factory LoginPageData.fromJson(Map<String, dynamic> json) =>
      _$LoginPageDataFromJson(json);
}

@JsonSerializable()
class RegisterInfoPageData implements IToJson {
  RegisterInfoPageData({this.type});
  final int type;

  @override
  Map<String, dynamic> toJson() => _$RegisterInfoPageDataToJson(this);

  factory RegisterInfoPageData.fromJson(Map<String, dynamic> json) =>
      _$RegisterInfoPageDataFromJson(json);
}

@JsonSerializable()
class AppealPageData implements IToJson {
  AppealPageData(
      {this.phone,
      this.school,
      this.code,
      this.name,
      this.collegeName,
      this.className,
      this.type});
  final int type;
  final String phone;
  final String school;
  final String code;
  final String name;
  final String collegeName;
  final String className;

  @override
  Map<String, dynamic> toJson() => _$AppealPageDataToJson(this);

  factory AppealPageData.fromJson(Map<String, dynamic> json) =>
      _$AppealPageDataFromJson(json);
}

@JsonSerializable()
class HomePageData implements IToJson {
  HomePageData();

  @override
  Map<String, dynamic> toJson() => _$HomePageDataToJson(this);

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);
}
