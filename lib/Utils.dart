import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import './data/common.dart';
import './Constant.dart';

///fluro 传递中文参数前，先转换，fluro 不支持中文传递
String fluroCnParamsEncode(String originalCn) {
  return jsonEncode(Utf8Encoder().convert(originalCn));
}

/// fluro 传递后取出参数，解析
String fluroCnParamsDecode(String encodeCn) {
  var list = List<int>();

  ///字符串解码
  jsonDecode(encodeCn).forEach(list.add);
  String value = Utf8Decoder().convert(list);
  return value;
}

String formatBytesSize(double bytesLength) {
  var str = packageSizes[0];
  if (bytesLength != double.infinity)
    for (var i = 1; i < packageSizes.length; i++) {
      var size = pow(1024, i);
      if (bytesLength >= size) {
        bytesLength /= size;
        str = packageSizes[i];
      } else {
        break;
      }
    }
  else
    bytesLength = 0;
  return '${bytesLength.toStringAsFixed(1)}$str';
}

String md5fy(String input) {
  return input == null || input.isEmpty
      ? input
      : hex.encode(md5.convert(utf8.encode(input)).bytes);
}

String objectToJson(IToJson obj) {
  return json.encode(obj);
}

Map<String, dynamic> jsonToObject(String str) {
  return json.decode(str);
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Future<bool> showToast(String msg,
    {Color backgroundColor,
    Color textColor,
    double fontSize: 16.0,
    Toast toastLength: Toast.LENGTH_SHORT,
    ToastGravity gravity: ToastGravity.BOTTOM,
    int timeInSecForIos: 1}) {
  return Fluttertoast.showToast(
      msg: msg,
      gravity: gravity,
      toastLength: toastLength,
      backgroundColor: backgroundColor,
      textColor: textColor,
      timeInSecForIos: timeInSecForIos,
      fontSize: fontSize);
}

String hidePhone(String phone, {int hideCount = 4, String hideWith = '*'}) {
  return phone.replaceRange(3, 3 + hideCount, hideWith * hideCount);
}

String hideEmail(String email, {String hideWith = '*'}) {
  int spliter = email.indexOf('@');
  return email.replaceRange(2, spliter, hideWith * (spliter - 2));
}

DecorationImage getDefaultIcon() {
  return DecorationImage(
      image: AssetImage('assets/common/icon_blue.png'), fit: BoxFit.contain);
}
