import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

String md5fy(String input) {
  return input == null || input.isEmpty
      ? input
      : hex.encode(md5.convert(utf8.encode(input)).bytes);
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
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
