// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLatestVersionResponse _$GetLatestVersionResponseFromJson(
    Map<String, dynamic> json) {
  return GetLatestVersionResponse(
    json['data'] == null
        ? null
        : AppVersionData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetAllQuestionTypesResponse _$GetAllQuestionTypesResponseFromJson(
    Map<String, dynamic> json) {
  return GetAllQuestionTypesResponse(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionTypeData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

Map<String, dynamic> _$PostUserQuestionToJson(PostUserQuestion instance) =>
    <String, dynamic>{
      'qtId': instance.qtId,
      'content': instance.content,
    };

PostUserQuestionResponse _$PostUserQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return PostUserQuestionResponse(
    json['data'] == null
        ? null
        : QuestionData.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

GetSchoolListResponse _$GetSchoolListResponseFromJson(
    Map<String, dynamic> json) {
  return GetSchoolListResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SchoolData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..code = json['code'] as int
    ..mess = json['mess'] as String;
}

AppVersionData _$AppVersionDataFromJson(Map<String, dynamic> json) {
  return AppVersionData(
    json['versionId'] as String,
    json['versionCode'] as String,
    json['downloadPath'] as String,
    json['createTime'] as String,
  );
}

Map<String, dynamic> _$AppVersionDataToJson(AppVersionData instance) =>
    <String, dynamic>{
      'versionId': instance.versionId,
      'versionCode': instance.versionCode,
      'downloadPath': instance.downloadPath,
      'createTime': instance.createTime,
    };

QuestionTypeData _$QuestionTypeDataFromJson(Map<String, dynamic> json) {
  return QuestionTypeData(
    json['qtId'] as String,
    json['qtName'] as String,
    json['createTime'] as String,
    json['isDelete'] as bool,
  );
}

Map<String, dynamic> _$QuestionTypeDataToJson(QuestionTypeData instance) =>
    <String, dynamic>{
      'qtId': instance.qtId,
      'qtName': instance.qtName,
      'createTime': instance.createTime,
      'isDelete': instance.isDelete,
    };

QuestionData _$QuestionDataFromJson(Map<String, dynamic> json) {
  return QuestionData(
    json['qtId'] as String,
    json['content'] as String,
    json['createTime'] as String,
    json['qid'] as String,
  );
}

Map<String, dynamic> _$QuestionDataToJson(QuestionData instance) =>
    <String, dynamic>{
      'qtId': instance.qtId,
      'content': instance.content,
      'createTime': instance.createTime,
      'qid': instance.qid,
    };

SchoolData _$SchoolDataFromJson(Map<String, dynamic> json) {
  return SchoolData(
    json['schoolId'] as String,
    json['schoolName'] as String,
  );
}

Map<String, dynamic> _$SchoolDataToJson(SchoolData instance) =>
    <String, dynamic>{
      'schoolId': instance.schoolId,
      'schoolName': instance.schoolName,
    };
