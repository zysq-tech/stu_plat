import 'package:json_annotation/json_annotation.dart';
import 'common.dart';

part 'apps.g.dart';

@JsonSerializable(createFactory: false)
class GetAppInfoPage implements IToJson {
  GetAppInfoPage(this.page, {this.size = 10});

  ///开始：1
  final int page;
  final int size;

  @override
  Map<String, dynamic> toJson() => _$GetAppInfoPageToJson(this);
}

@JsonSerializable(createToJson: false)
class GetAppInfoPageResponse with CommonResponseMixin {
  GetAppInfoPageResponse(this.data);
  final AppInfoPageData data;

  factory GetAppInfoPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppInfoPageResponseFromJson(json);
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

@JsonSerializable(createFactory: false)
class GetAppCommentsPage with CommonPageRequestMixin implements IToJson {
  GetAppCommentsPage();
  @override
  Map<String, dynamic> toJson() => _$GetAppCommentsPageToJson(this);
}

@JsonSerializable(createToJson: false)
class GetAppCommentsPageResponse with CommonResponseMixin {
  GetAppCommentsPageResponse(this.data);
  final AppCommentPageData data;

  factory GetAppCommentsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppCommentsPageResponseFromJson(json);
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
      this.isBoutique,
      this.appImgList);
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

  ///是否今日最佳
  final bool todayBest;

  ///是否精品
  final bool isBoutique;

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
      this.praiseContent, this.appInfo);
  final String praiseId;
  final String appId;
  final String userId;
  final double praiseScore;
  final String praiseContent;
  final AppInfoData appInfo;

  @override
  Map<String, dynamic> toJson() => _$AppCommentDataToJson(this);

  factory AppCommentData.fromJson(Map<String, dynamic> json) =>
      _$AppCommentDataFromJson(json);
}

@JsonSerializable()
class AppLabelData implements IToJson {
  AppLabelData(this.labelId, this.labelName, this.sortNum, this.parentLabelId);
  final String labelId;
  final String labelName;
  final String sortNum;
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
