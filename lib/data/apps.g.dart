// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetAppInfoPageToJson(GetAppInfoPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetAppInfoPageResponse _$GetAppInfoPageResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppInfoPageResponse(
    json['data'] == null
        ? null
        : AppInfoPageData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetAppBestListResponse _$GetAppBestListResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppBestListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AppInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetAppDetailResponse _$GetAppDetailResponseFromJson(Map<String, dynamic> json) {
  return GetAppDetailResponse(
    json['data'] == null
        ? null
        : AppInfoData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

AppInfoPageData _$AppInfoPageDataFromJson(Map<String, dynamic> json) {
  return AppInfoPageData(
    (json['content'] as List)
        ?.map((e) =>
            e == null ? null : AppInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['first'] as bool,
    json['last'] as bool,
    json['totalElements'] as int,
    json['totalPages'] as int,
    json['numberOfElements'] as int,
    json['size'] as int,
    json['number'] as int,
  );
}

Map<String, dynamic> _$AppInfoPageDataToJson(AppInfoPageData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'first': instance.first,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'numberOfElements': instance.numberOfElements,
      'size': instance.size,
      'number': instance.number,
    };

AppInfoData _$AppInfoDataFromJson(Map<String, dynamic> json) {
  return AppInfoData(
    json['appId'] as String,
    json['appLogo'] as String,
    json['appName'] as String,
    json['appIntroduce'] as String,
    json['appDescription'] as String,
    json['appInformation'] as String,
    json['appUpdateIntroduce'] as String,
    json['appSize'] as int,
    json['downloadAddress'] as String,
    json['appUseRecord'] == null
        ? null
        : AppRecordData.fromJson(json['appUseRecord'] as Map<String, dynamic>),
    json['createtime'] as String,
    json['updateTime'] as String,
    json['todayBest'] as bool,
    json['isBoutique'] as bool,
  );
}

Map<String, dynamic> _$AppInfoDataToJson(AppInfoData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'appLogo': instance.appLogo,
      'appName': instance.appName,
      'appIntroduce': instance.appIntroduce,
      'appDescription': instance.appDescription,
      'appInformation': instance.appInformation,
      'appUpdateIntroduce': instance.appUpdateIntroduce,
      'appSize': instance.appSize,
      'downloadAddress': instance.downloadAddress,
      'appUseRecord': instance.appUseRecord,
      'createtime': instance.createtime,
      'updateTime': instance.updateTime,
      'todayBest': instance.todayBest,
      'isBoutique': instance.isBoutique,
    };

AppRecordData _$AppRecordDataFromJson(Map<String, dynamic> json) {
  return AppRecordData(
    json['appId'] as String,
    json['recordId'] as String,
    json['downloadNum'] as int,
    json['searchNum'] as int,
  );
}

Map<String, dynamic> _$AppRecordDataToJson(AppRecordData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'recordId': instance.recordId,
      'downloadNum': instance.downloadNum,
      'searchNum': instance.searchNum,
    };
