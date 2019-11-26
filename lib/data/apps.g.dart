// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$GetLeaderBoardAppPageToJson(
        GetLeaderBoardAppPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetLeaderBoardAppPageResponse _$GetLeaderBoardAppPageResponseFromJson(
    Map<String, dynamic> json) {
  return GetLeaderBoardAppPageResponse(
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

DeleteUserAppCommentResponse _$DeleteUserAppCommentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserAppCommentResponse()
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$GetUserAppCommentsPageToJson(
        GetUserAppCommentsPage instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetUserAppCommentsPageResponse _$GetUserAppCommentsPageResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserAppCommentsPageResponse(
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

GetHomeTagListResponse _$GetHomeTagListResponseFromJson(
    Map<String, dynamic> json) {
  return GetHomeTagListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : HomeTagData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetHomeTaggedAppListResponse _$GetHomeTaggedAppListResponseFromJson(
    Map<String, dynamic> json) {
  return GetHomeTaggedAppListResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TaggedAppInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetTabListResponse _$GetTabListResponseFromJson(Map<String, dynamic> json) {
  return GetTabListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : TabInfoData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$GetAppCommentListToJson(GetAppCommentList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };

GetAppCommentListResponse _$GetAppCommentListResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppCommentListResponse(
    json['data'] == null
        ? null
        : AppCommentPageData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetAppAverageRatingResponse _$GetAppAverageRatingResponseFromJson(
    Map<String, dynamic> json) {
  return GetAppAverageRatingResponse(
    (json['data'] as num)?.toDouble(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$SearchAppToJson(SearchApp instance) => <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'appName': instance.appName,
    };

SearchAppResponse _$SearchAppResponseFromJson(Map<String, dynamic> json) {
  return SearchAppResponse(
    json['data'] == null
        ? null
        : AppInfoPageData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$RecordAppToJson(RecordApp instance) => <String, dynamic>{
      'appId': instance.appId,
      'useType': instance.useType,
      'recordId': instance.recordId,
    };

RecordAppResponse _$RecordAppResponseFromJson(Map<String, dynamic> json) {
  return RecordAppResponse(
    data: json['data'] as String,
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
    json['todayBestImg'] as String,
    json['isBoutique'] as bool,
    json['isDelete'] as bool,
    (json['appImgList'] as List)
        ?.map((e) =>
            e == null ? null : AppImgData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['appLabelRelationList'] as List)
        ?.map((e) => e == null
            ? null
            : AppLabelRelationData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['appVersion'] as String,
    json['appPackName'] as String,
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
      'appLabelRelationList': instance.appLabelRelationList,
      'todayBest': instance.todayBest,
      'todayBestImg': instance.todayBestImg,
      'isBoutique': instance.isBoutique,
      'isDelete': instance.isDelete,
      'appVersion': instance.appVersion,
      'appPackName': instance.appPackName,
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
    json['userInfo'] == null
        ? null
        : UserInfoData.fromJson(json['userInfo'] as Map<String, dynamic>),
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
      'userInfo': instance.userInfo,
    };

AppLabelData _$AppLabelDataFromJson(Map<String, dynamic> json) {
  return AppLabelData(
    json['labelId'] as String,
    json['labelName'] as String,
    json['sortNum'] as String,
    json['labelImg'] as String,
    json['parentLabelId'] as String,
  );
}

Map<String, dynamic> _$AppLabelDataToJson(AppLabelData instance) =>
    <String, dynamic>{
      'labelId': instance.labelId,
      'labelName': instance.labelName,
      'sortNum': instance.sortNum,
      'labelImg': instance.labelImg,
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

AppLabelRelationData _$AppLabelRelationDataFromJson(Map<String, dynamic> json) {
  return AppLabelRelationData(
    json['relationId'] as String,
    json['appId'] as String,
    json['labelId'] as String,
    json['appLabel'] == null
        ? null
        : AppLabelData.fromJson(json['appLabel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppLabelRelationDataToJson(
        AppLabelRelationData instance) =>
    <String, dynamic>{
      'relationId': instance.relationId,
      'appId': instance.appId,
      'labelId': instance.labelId,
      'appLabel': instance.appLabel,
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

HomeTagData _$HomeTagDataFromJson(Map<String, dynamic> json) {
  return HomeTagData(
    json['mainId'] as String,
    json['title'] as String,
    json['sortNum'] as int,
    json['createTime'] as String,
  );
}

Map<String, dynamic> _$HomeTagDataToJson(HomeTagData instance) =>
    <String, dynamic>{
      'mainId': instance.mainId,
      'title': instance.title,
      'sortNum': instance.sortNum,
      'createTime': instance.createTime,
    };

TaggedAppInfoData _$TaggedAppInfoDataFromJson(Map<String, dynamic> json) {
  return TaggedAppInfoData(
    json['appId'] as String,
    json['mainId'] as String,
    json['sortNum'] as int,
    json['relationId'] as String,
    json['appInfo'] == null
        ? null
        : AppInfoData.fromJson(json['appInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TaggedAppInfoDataToJson(TaggedAppInfoData instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'mainId': instance.mainId,
      'sortNum': instance.sortNum,
      'relationId': instance.relationId,
      'appInfo': instance.appInfo,
    };

TabInfoData _$TabInfoDataFromJson(Map<String, dynamic> json) {
  return TabInfoData(
    json['tabId'] as String,
    json['tabName'] as String,
    json['tabPath'] as String,
    json['sortNum'] as String,
  );
}

Map<String, dynamic> _$TabInfoDataToJson(TabInfoData instance) =>
    <String, dynamic>{
      'tabId': instance.tabId,
      'tabName': instance.tabName,
      'tabPath': instance.tabPath,
      'sortNum': instance.sortNum,
    };
