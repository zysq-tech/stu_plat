// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPageData _$LoginPageDataFromJson(Map<String, dynamic> json) {
  return LoginPageData();
}

Map<String, dynamic> _$LoginPageDataToJson(LoginPageData instance) =>
    <String, dynamic>{};

RegisterInfoPageData _$RegisterInfoPageDataFromJson(Map<String, dynamic> json) {
  return RegisterInfoPageData(
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$RegisterInfoPageDataToJson(
        RegisterInfoPageData instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

AppealPageData _$AppealPageDataFromJson(Map<String, dynamic> json) {
  return AppealPageData(
    phone: json['phone'] as String,
    school: json['school'] as String,
    code: json['code'] as String,
    name: json['name'] as String,
    collegeName: json['collegeName'] as String,
    className: json['className'] as String,
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$AppealPageDataToJson(AppealPageData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'phone': instance.phone,
      'school': instance.school,
      'code': instance.code,
      'name': instance.name,
      'collegeName': instance.collegeName,
      'className': instance.className,
    };

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) {
  return HomePageData();
}

Map<String, dynamic> _$HomePageDataToJson(HomePageData instance) =>
    <String, dynamic>{};

UserInfoPageData _$UserInfoPageDataFromJson(Map<String, dynamic> json) {
  return UserInfoPageData(
    nickName: json['nickName'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserInfoPageDataToJson(UserInfoPageData instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'phone': instance.phone,
      'email': instance.email,
    };

EditPhoneEmailPageData _$EditPhoneEmailPageDataFromJson(
    Map<String, dynamic> json) {
  return EditPhoneEmailPageData(
    type: json['type'] as int,
    initialization: json['initialization'] as bool,
  );
}

Map<String, dynamic> _$EditPhoneEmailPageDataToJson(
        EditPhoneEmailPageData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'initialization': instance.initialization,
    };

UnregisterPageData _$UnregisterPageDataFromJson(Map<String, dynamic> json) {
  return UnregisterPageData();
}

Map<String, dynamic> _$UnregisterPageDataToJson(UnregisterPageData instance) =>
    <String, dynamic>{};

HelpCenterPageData _$HelpCenterPageDataFromJson(Map<String, dynamic> json) {
  return HelpCenterPageData();
}

Map<String, dynamic> _$HelpCenterPageDataToJson(HelpCenterPageData instance) =>
    <String, dynamic>{};

FeedbackPageData _$FeedbackPageDataFromJson(Map<String, dynamic> json) {
  return FeedbackPageData();
}

Map<String, dynamic> _$FeedbackPageDataToJson(FeedbackPageData instance) =>
    <String, dynamic>{};

AppDetailPageData _$AppDetailPageDataFromJson(Map<String, dynamic> json) {
  return AppDetailPageData(
    appData: json['appData'] == null
        ? null
        : AppInfoData.fromJson(json['appData'] as Map<String, dynamic>),
    firstShow: json['firstShow'] as int,
  );
}

Map<String, dynamic> _$AppDetailPageDataToJson(AppDetailPageData instance) =>
    <String, dynamic>{
      'appData': instance.appData,
      'firstShow': instance.firstShow,
    };
