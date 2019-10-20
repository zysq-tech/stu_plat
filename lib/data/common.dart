abstract class IToJson {
  Map<String, dynamic> toJson();
}

mixin CommonResponseMixin {
  int code;
  String mess;
}

mixin CommonPageRequestMixin {
  int page;
  int size;
}

mixin CommonPageInfoMixin {
  bool first;
  bool last;
  int totalElements;
  int totalPages;
  int numberOfElements;
  int size;

  ///当前第几页, 起始：0
  int number;
}

mixin CommonTimeMixin {
  String createtime;
  String updateTime;
}
