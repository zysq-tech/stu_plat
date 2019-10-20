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

Map<String, dynamic> _$CommentAppToJson(CommentApp instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'praiseScore': instance.praiseScore,
      'praiseContent': instance.praiseContent,
    };

CommentAppResponse _$CommentAppResponseFromJson(Map<String, dynamic> json) {
  return CommentAppResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$GetAppCommentsPageToJson(GetAppCommentsPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetAppCommentsPageResponse _$GetAppCommentsPageResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppCommentsPageResponse(
    json['data'] == null
        ? null
        : AppCommentPageData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$GetAppLabelListToJson(GetAppLabelList instance) =>
    <String, dynamic>{
      'labelId': instance.labelId,
    };

GetAppLabelListResponse _$GetAppLabelListResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppLabelListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : AppLabelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$GetAppPageWithLabelToJson(
        GetAppPageWithLabel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetAppPageWithLabelResponse _$GetAppPageWithLabelResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppPageWithLabelResponse(
    json['data'] == null
        ? null
        : AppPageByLabelData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetChoosenAppListResponse _$GetChoosenAppListResponseFromJson(
    Map<String, dynamic> json) {
  return GetChoosenAppListResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ChoosenAppData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
  )
    ..first = json['first'] as bool
    ..last = json['last'] as bool
    ..totalElements = json['totalElements'] as int
    ..totalPages = json['totalPages'] as int
    ..numberOfElements = json['numberOfElements'] as int
    ..size = json['size'] as int
    ..number = json['number'] as int;
}

Map<String, dynamic> _$AppInfoPageDataToJson(AppInfoPageData instance) =>
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
    json['todayBest'] as bool,
    json['isBoutique'] as bool,
    (json['appImgList'] as List)
        ?.map((e) =>
            e == null ? null : AppImgData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..createtime = json['createtime'] as String
    ..updateTime = json['updateTime'] as String;
}

Map<String, dynamic> _$AppInfoDataToJson(AppInfoData instance) =>
    <String, dynamic>{
      'createtime': instance.createtime,
      'updateTime': instance.updateTime,
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
      'appImgList': instance.appImgList,
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

AppImgData _$AppImgDataFromJson(Map<String, dynamic> json) {
  return AppImgData(
    json['appId'] as String,
    json['appImgId'] as String,
    json['imgPath'] as String,
    json['sortNum'] as String,
  );
}

Map<String, dynamic> _$AppImgDataToJson(AppImgData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'appImgId': instance.appImgId,
      'imgPath': instance.imgPath,
      'sortNum': instance.sortNum,
    };

AppCommentPageData _$AppCommentPageDataFromJson(Map<String, dynamic> json) {
  return AppCommentPageData(
    (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : AppCommentData.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$AppCommentPageDataToJson(AppCommentPageData instance) =>
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

AppCommentData _$AppCommentDataFromJson(Map<String, dynamic> json) {
  return AppCommentData(
    json['praiseId'] as String,
    json['appId'] as String,
    json['userId'] as String,
    (json['praiseScore'] as num)?.toDouble(),
    json['praiseContent'] as String,
    json['appInfo'] == null
        ? null
        : AppInfoData.fromJson(json['appInfo'] as Map<String, dynamic>),
  )
    ..createtime = json['createtime'] as String
    ..updateTime = json['updateTime'] as String;
}

Map<String, dynamic> _$AppCommentDataToJson(AppCommentData instance) =>
    <String, dynamic>{
      'createtime': instance.createtime,
      'updateTime': instance.updateTime,
      'praiseId': instance.praiseId,
      'appId': instance.appId,
      'userId': instance.userId,
      'praiseScore': instance.praiseScore,
      'praiseContent': instance.praiseContent,
      'appInfo': instance.appInfo,
    };

AppLabelData _$AppLabelDataFromJson(Map<String, dynamic> json) {
  return AppLabelData(
    json['labelId'] as String,
    json['labelName'] as String,
    json['sortNum'] as String,
    json['parentLabelId'] as String,
  );
}

Map<String, dynamic> _$AppLabelDataToJson(AppLabelData instance) =>
    <String, dynamic>{
      'labelId': instance.labelId,
      'labelName': instance.labelName,
      'sortNum': instance.sortNum,
      'parentLabelId': instance.parentLabelId,
    };

AppWithLabelInfoData _$AppWithLabelInfoDataFromJson(Map<String, dynamic> json) {
  return AppWithLabelInfoData(
    json['appId'] as String,
    json['labelId'] as String,
    json['appInfo'] == null
        ? null
        : AppInfoData.fromJson(json['appInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppWithLabelInfoDataToJson(
        AppWithLabelInfoData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'labelId': instance.labelId,
      'appInfo': instance.appInfo,
    };

AppPageByLabelData _$AppPageByLabelDataFromJson(Map<String, dynamic> json) {
  return AppPageByLabelData(
    (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : AppWithLabelInfoData.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$AppPageByLabelDataToJson(AppPageByLabelData instance) =>
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

ChoosenAppData _$ChoosenAppDataFromJson(Map<String, dynamic> json) {
  return ChoosenAppData(
    json['appId'] as String,
    json['chooseId'] as String,
    json['chooseImg'] as String,
    json['chooseName'] as String,
    json['sortNum'] as String,
  );
}

Map<String, dynamic> _$ChoosenAppDataToJson(ChoosenAppData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'chooseId': instance.chooseId,
      'chooseImg': instance.chooseImg,
      'chooseName': instance.chooseName,
      'sortNum': instance.sortNum,
    };
