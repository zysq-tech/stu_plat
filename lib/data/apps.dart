import 'package:json_annotation/json_annotation.dart';
import 'common.dart';
import 'user.dart';

part 'apps.g.dart';

@JsonSerializable(createFactory: false)
class GetLeaderBoardAppPage with CommonPageRequestMixin implements IToJson {
  GetLeaderBoardAppPage();

  @override
  Map<String, dynamic> toJson() => _$GetLeaderBoardAppPageToJson(this);
}

@JsonSerializable(createToJson: false)
class GetLeaderBoardAppPageResponse with CommonResponseMixin {
  GetLeaderBoardAppPageResponse(this.data);
  final AppInfoPageData data;

  factory GetLeaderBoardAppPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLeaderBoardAppPageResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetAppBestListResponse with CommonResponseMixin {
  GetAppBestListResponse(this.data);
  final List<AppInfoData> data;

  factory GetAppBestListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppBestListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetAppDetailResponse with CommonResponseMixin {
  GetAppDetailResponse(this.data);
  final AppInfoData data;

  factory GetAppDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppDetailResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class CommentApp implements IToJson {
  CommentApp(this.appId, this.praiseScore, this.praiseContent);
  final String appId;
  final double praiseScore;
  final String praiseContent;

  @override
  Map<String, dynamic> toJson() => _$CommentAppToJson(this);
}

@JsonSerializable(createToJson: false)
class CommentAppResponse with CommonResponseMixin {
  CommentAppResponse();

  factory CommentAppResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentAppResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class DeleteUserAppCommentResponse with CommonResponseMixin {
  DeleteUserAppCommentResponse();

  factory DeleteUserAppCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserAppCommentResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class GetUserAppCommentsPage with CommonPageRequestMixin implements IToJson {
  GetUserAppCommentsPage();
  @override
  Map<String, dynamic> toJson() => _$GetUserAppCommentsPageToJson(this);
}

@JsonSerializable(createToJson: false)
class GetUserAppCommentsPageResponse with CommonResponseMixin {
  GetUserAppCommentsPageResponse(this.data);
  final AppCommentPageData data;

  factory GetUserAppCommentsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserAppCommentsPageResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class GetAppLabelList implements IToJson {
  GetAppLabelList(this.labelId);

  ///父标签Id
  final String labelId;

  @override
  Map<String, dynamic> toJson() => _$GetAppLabelListToJson(this);
}

@JsonSerializable(createToJson: false)
class GetAppLabelListResponse with CommonResponseMixin {
  GetAppLabelListResponse(this.data);
  final List<AppLabelData> data;

  factory GetAppLabelListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppLabelListResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class GetAppPageWithLabel with CommonPageRequestMixin implements IToJson {
  GetAppPageWithLabel();

  @override
  Map<String, dynamic> toJson() => _$GetAppPageWithLabelToJson(this);
}

@JsonSerializable(createToJson: false)
class GetAppPageWithLabelResponse with CommonResponseMixin {
  GetAppPageWithLabelResponse(this.data);
  final AppPageByLabelData data;

  factory GetAppPageWithLabelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppPageWithLabelResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetChoosenAppListResponse with CommonResponseMixin {
  GetChoosenAppListResponse(this.data);
  final List<ChoosenAppData> data;

  factory GetChoosenAppListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChoosenAppListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetHomeTagListResponse with CommonResponseMixin {
  GetHomeTagListResponse(this.data);
  final List<HomeTagData> data;

  factory GetHomeTagListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHomeTagListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetHomeTaggedAppListResponse with CommonResponseMixin {
  GetHomeTaggedAppListResponse(this.data);
  final List<TaggedAppInfoData> data;

  factory GetHomeTaggedAppListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetHomeTaggedAppListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetTabListResponse with CommonResponseMixin {
  GetTabListResponse(this.data);
  final List<TabInfoData> data;

  factory GetTabListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTabListResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class GetAppCommentList with CommonPageRequestMixin implements IToJson {
  GetAppCommentList();

  @override
  Map<String, dynamic> toJson() => _$GetAppCommentListToJson(this);
}

@JsonSerializable(createToJson: false)
class GetAppCommentListResponse with CommonResponseMixin {
  GetAppCommentListResponse(this.data);
  final AppCommentPageData data;

  factory GetAppCommentListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppCommentListResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetAppAverageRatingResponse with CommonResponseMixin {
  GetAppAverageRatingResponse(this.data);
  final double data;

  factory GetAppAverageRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppAverageRatingResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class SearchApp with CommonPageRequestMixin implements IToJson {
  SearchApp(this.appName);
  final String appName;

  @override
  Map<String, dynamic> toJson() => _$SearchAppToJson(this);
}

@JsonSerializable(createToJson: false)
class SearchAppResponse with CommonResponseMixin {
  SearchAppResponse(this.data);
  final AppInfoPageData data;

  factory SearchAppResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAppResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class RecordApp implements IToJson {
  RecordApp(this.appId, this.useType, {this.recordId});

  final String appId;

  /// 1: 下载完成; 2: 安装完成
  final int useType;

  ///useType == 2时非null
  final String recordId;

  @override
  Map<String, dynamic> toJson() => _$RecordAppToJson(this);
}

@JsonSerializable(createToJson: false)
class RecordAppResponse with CommonResponseMixin {
  RecordAppResponse({this.data});

  ///recordId
  final String data;

  factory RecordAppResponse.fromJson(Map<String, dynamic> json) =>
      _$RecordAppResponseFromJson(json);
}

//Data
@JsonSerializable()
class AppInfoPageData with CommonPageInfoMixin implements IToJson {
  AppInfoPageData(this.content);
  final List<AppInfoData> content;

  @override
  Map<String, dynamic> toJson() => _$AppInfoPageDataToJson(this);

  factory AppInfoPageData.fromJson(Map<String, dynamic> json) =>
      _$AppInfoPageDataFromJson(json);
}

@JsonSerializable()
class AppInfoData with CommonTimeMixin implements IToJson {
  AppInfoData(
      this.appId,
      this.appLogo,
      this.appName,
      this.appIntroduce,
      this.appDescription,
      this.appInformation,
      this.appUpdateIntroduce,
      this.appSize,
      this.downloadAddress,
      this.appUseRecord,
      this.todayBest,
      this.todayBestImg,
      this.isBoutique,
      this.isDelete,
      this.appImgList,
      this.appLabelRelationList,
      this.appVersion,
      this.appPackName);
  final String appId;
  final String appLogo;
  final String appName;
  final String appIntroduce;
  final String appDescription;
  final String appInformation;
  final String appUpdateIntroduce;
  final int appSize;
  final String downloadAddress;
  final AppRecordData appUseRecord;
  final List<AppImgData> appImgList;
  final List<AppLabelRelationData> appLabelRelationList;

  ///是否今日最佳
  final bool todayBest;
  final String todayBestImg;

  ///是否精品
  final bool isBoutique;

  ///删除信息
  final bool isDelete;

  ///Apk包体数据
  final String appVersion;
  final String appPackName;

  @override
  Map<String, dynamic> toJson() => _$AppInfoDataToJson(this);

  factory AppInfoData.fromJson(Map<String, dynamic> json) =>
      _$AppInfoDataFromJson(json);
}

@JsonSerializable()
class AppRecordData implements IToJson {
  AppRecordData(this.appId, this.recordId, this.downloadNum, this.searchNum);
  final String appId;
  final String recordId;
  final int downloadNum;
  final int searchNum;

  @override
  Map<String, dynamic> toJson() => _$AppRecordDataToJson(this);

  factory AppRecordData.fromJson(Map<String, dynamic> json) =>
      _$AppRecordDataFromJson(json);
}

@JsonSerializable()
class AppImgData implements IToJson {
  AppImgData(this.appId, this.appImgId, this.imgPath, this.sortNum);
  final String appId;
  final String appImgId;
  final String imgPath;
  final String sortNum;

  @override
  Map<String, dynamic> toJson() => _$AppImgDataToJson(this);

  factory AppImgData.fromJson(Map<String, dynamic> json) =>
      _$AppImgDataFromJson(json);
}

@JsonSerializable()
class AppCommentPageData with CommonPageInfoMixin implements IToJson {
  AppCommentPageData(this.content);
  final List<AppCommentData> content;

  @override
  Map<String, dynamic> toJson() => _$AppCommentPageDataToJson(this);

  factory AppCommentPageData.fromJson(Map<String, dynamic> json) =>
      _$AppCommentPageDataFromJson(json);
}

@JsonSerializable()
class AppCommentData with CommonTimeMixin implements IToJson {
  AppCommentData(this.praiseId, this.appId, this.userId, this.praiseScore,
      this.praiseContent, this.appInfo, this.userInfo);
  final String praiseId;
  final String appId;
  final String userId;
  final double praiseScore;
  final String praiseContent;
  final AppInfoData appInfo;

  ///null when get self comment
  final UserInfoData userInfo;

  @override
  Map<String, dynamic> toJson() => _$AppCommentDataToJson(this);

  factory AppCommentData.fromJson(Map<String, dynamic> json) =>
      _$AppCommentDataFromJson(json);
}

@JsonSerializable()
class AppLabelData implements IToJson {
  AppLabelData(this.labelId, this.labelName, this.sortNum, this.labelImg,
      this.parentLabelId);
  final String labelId;
  final String labelName;
  final String sortNum;

  ///父标签有图片
  final String labelImg;

  ///子标签有父标签Id
  final String parentLabelId;

  @override
  Map<String, dynamic> toJson() => _$AppLabelDataToJson(this);

  factory AppLabelData.fromJson(Map<String, dynamic> json) =>
      _$AppLabelDataFromJson(json);
}

@JsonSerializable()
class AppWithLabelInfoData implements IToJson {
  AppWithLabelInfoData(this.appId, this.labelId, this.appInfo);
  final String appId;
  final String labelId;
  final AppInfoData appInfo;

  @override
  Map<String, dynamic> toJson() => _$AppWithLabelInfoDataToJson(this);

  factory AppWithLabelInfoData.fromJson(Map<String, dynamic> json) =>
      _$AppWithLabelInfoDataFromJson(json);
}

@JsonSerializable()
class AppPageByLabelData with CommonPageInfoMixin implements IToJson {
  AppPageByLabelData(this.content);
  final List<AppWithLabelInfoData> content;

  @override
  Map<String, dynamic> toJson() => _$AppPageByLabelDataToJson(this);

  factory AppPageByLabelData.fromJson(Map<String, dynamic> json) =>
      _$AppPageByLabelDataFromJson(json);
}

@JsonSerializable()
class AppLabelRelationData implements IToJson {
  AppLabelRelationData(
      this.relationId, this.appId, this.labelId, this.appLabel);
  final String relationId;
  final String appId;
  final String labelId;
  final AppLabelData appLabel;

  @override
  Map<String, dynamic> toJson() => _$AppLabelRelationDataToJson(this);

  factory AppLabelRelationData.fromJson(Map<String, dynamic> json) =>
      _$AppLabelRelationDataFromJson(json);
}

@JsonSerializable()
class ChoosenAppData implements IToJson {
  ChoosenAppData(
      this.appId, this.chooseId, this.chooseImg, this.chooseName, this.sortNum);
  final String appId;
  final String chooseId;
  final String chooseImg;
  final String chooseName;
  final String sortNum;

  @override
  Map<String, dynamic> toJson() => _$ChoosenAppDataToJson(this);

  factory ChoosenAppData.fromJson(Map<String, dynamic> json) =>
      _$ChoosenAppDataFromJson(json);
}

@JsonSerializable()
class HomeTagData implements IToJson {
  HomeTagData(this.mainId, this.title, this.sortNum, this.createTime);
  final String mainId;
  final String title;
  final int sortNum;
  final String createTime;

  @override
  Map<String, dynamic> toJson() => _$HomeTagDataToJson(this);

  factory HomeTagData.fromJson(Map<String, dynamic> json) =>
      _$HomeTagDataFromJson(json);
}

@JsonSerializable()
class TaggedAppInfoData implements IToJson {
  TaggedAppInfoData(
      this.appId, this.mainId, this.sortNum, this.relationId, this.appInfo);
  final String appId;
  final String mainId;
  final int sortNum;
  final String relationId;
  final AppInfoData appInfo;

  @override
  Map<String, dynamic> toJson() => _$TaggedAppInfoDataToJson(this);

  factory TaggedAppInfoData.fromJson(Map<String, dynamic> json) =>
      _$TaggedAppInfoDataFromJson(json);
}

@JsonSerializable()
class TabInfoData implements IToJson {
  TabInfoData(this.tabId, this.tabName, this.tabPath, this.sortNum);
  final String tabId;
  final String tabName;
  final String tabPath;
  final String sortNum;

  @override
  Map<String, dynamic> toJson() => _$TabInfoDataToJson(this);

  factory TabInfoData.fromJson(Map<String, dynamic> json) =>
      _$TabInfoDataFromJson(json);
}
