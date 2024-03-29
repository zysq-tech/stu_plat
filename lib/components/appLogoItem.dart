import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/apps.dart';
import '../Utils.dart';

class AppLogoItem extends StatelessWidget {
  AppLogoItem({this.data, this.onTap});

  final AppInfoData data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil.getInstance();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: su.setWidth(150),
        height: su.setWidth(205),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: su.setWidth(144),
              height: su.setWidth(144),
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(su.setWidth(20)),
                  image: getDefaultIcon()),
            ),
            Text(
              'App Name',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: TextStyle(
                  color: hexToColor('#262626'), fontSize: su.setSp(35)),
            )
          ],
        ),
      ),
    );
  }
}
