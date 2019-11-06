import 'package:json_annotation/json_annotation.dart';

import './common.dart';

part 'preference.g.dart';

@JsonSerializable()
class UserPreference implements IToJson {
  UserPreference();
  String token;

  @override
  Map<String, dynamic> toJson() => _$UserPreferenceToJson(this);

  factory UserPreference.fromJson(Map<String, dynamic> json) =>
      _$UserPreferenceFromJson(json);
}

@JsonSerializable()
class DownloadPreference implements IToJson {
  DownloadPreference();

  @override
  Map<String, dynamic> toJson() => _$DownloadPreferenceToJson(this);

  factory DownloadPreference.fromJson(Map<String, dynamic> json) =>
      _$DownloadPreferenceFromJson(json);
}
