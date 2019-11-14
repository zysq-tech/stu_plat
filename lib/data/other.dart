import 'package:json_annotation/json_annotation.dart';

import 'common.dart';

part 'other.g.dart';

@JsonSerializable(createToJson: false)
class GetLatestVersionResponse with CommonResponseMixin {
  GetLatestVersionResponse(this.data);
  final AppVersionData data;

  factory GetLatestVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLatestVersionResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetAllQuestionTypesResponse with CommonResponseMixin {
  GetAllQuestionTypesResponse(this.data);
  final List<QuestionTypeData> data;

  factory GetAllQuestionTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionTypesResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class PostUserQuestion implements IToJson {
  PostUserQuestion(this.qtId, this.content);
  final String qtId;
  final String content;

  @override
  Map<String, dynamic> toJson() => _$PostUserQuestionToJson(this);
}

@JsonSerializable(createToJson: false)
class PostUserQuestionResponse with CommonResponseMixin {
  PostUserQuestionResponse(this.data);
  final QuestionData data;

  factory PostUserQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$PostUserQuestionResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GetSchoolListResponse with CommonResponseMixin {
  GetSchoolListResponse(this.data);

  final List<SchoolData> data;

  factory GetSchoolListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSchoolListResponseFromJson(json);
}

//Data
@JsonSerializable()
class AppVersionData implements IToJson {
  AppVersionData(
      this.versionId, this.versionCode, this.downloadPath, this.createTime);
  final String versionId;
  final String versionCode;
  final String downloadPath;
  final String createTime;

  @override
  Map<String, dynamic> toJson() => _$AppVersionDataToJson(this);

  factory AppVersionData.fromJson(Map<String, dynamic> json) =>
      _$AppVersionDataFromJson(json);
}

@JsonSerializable()
class QuestionTypeData implements IToJson {
  QuestionTypeData(this.qtId, this.qtName, this.createTime, this.isDelete);
  final String qtId;
  final String qtName;
  final String createTime;
  final bool isDelete;

  @override
  Map<String, dynamic> toJson() => _$QuestionTypeDataToJson(this);

  factory QuestionTypeData.fromJson(Map<String, dynamic> json) =>
      _$QuestionTypeDataFromJson(json);
}

@JsonSerializable()
class QuestionData implements IToJson {
  QuestionData(this.qtId, this.content, this.createTime, this.qid);
  final String qtId;
  final String content;
  final String createTime;
  final String qid;

  @override
  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);
}

@JsonSerializable()
class SchoolData implements IToJson {
  SchoolData(this.schoolId, this.schoolName);

  final String schoolId;
  final String schoolName;

  @override
  Map<String, dynamic> toJson() => _$SchoolDataToJson(this);

  factory SchoolData.fromJson(Map<String, dynamic> json) =>
      _$SchoolDataFromJson(json);
}
