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

@JsonSerializable()
class AppInfoPageData implements IToJson {
  AppInfoPageData(this.content, this.first, this.last, this.totalElements,
      this.totalPages, this.numberOfElements, this.size, this.number);
  final List<AppInfoData> content;
  final bool first;
  final bool last;
  final int totalElements;
  final int totalPages;
  final int numberOfElements;
  final int size;

  ///当前第几页, 起始：0
  final int number;

  @override
  Map<String, dynamic> toJson() => _$AppInfoPageDataToJson(this);

  factory AppInfoPageData.fromJson(Map<String, dynamic> json) =>
      _$AppInfoPageDataFromJson(json);
}

@JsonSerializable()
class AppInfoData implements IToJson {
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
      this.createtime,
      this.updateTime,
      this.todayBest,
      this.isBoutique);
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
  final String createtime;
  final String updateTime;

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
