abstract class IToJson {
  Map<String, dynamic> toJson();
}

mixin CommonResponseMixin {
  int code;
  String mess;
}
