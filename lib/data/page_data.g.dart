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
