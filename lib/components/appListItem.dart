import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils.dart';
import '../Constant.dart';
import '../data/apps.dart';

const double designWidth = 885;
const double designHeight = 154;

class AppListItem extends StatelessWidget {
  AppListItem({this.width, this.height, this.margin, this.data});

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final AppInfoData data;

  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil.getInstance();
    final fwidth = width ?? designWidth;
    final fheight = height ?? designHeight;
    final wFactor = fwidth / designWidth;
    final hFactor = fheight / designHeight;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: su.setWidth(fwidth),
        height: su.setHeight(fheight),
        padding: EdgeInsets.symmetric(
            horizontal: su.setWidth(5 * wFactor),
            vertical: su.setHeight(5 * hFactor)),
        margin: margin,
        child: Row(
          children: <Widget>[
            Container(
              width: su.setWidth(144 * wFactor),
              height: su.setHeight(144 * hFactor),
              decoration: BoxDecoration(
                  image: null,
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(su.setHeight(20))),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: su.setWidth(20 * wFactor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: su.setHeight(44 * hFactor)),
                      child: Text(
                        'App Name ' * 5,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: hexToColor('#262626'),
                            fontSize: su.setSp(35)),
                      ),
                    ),
                    Text(
                      'App Description ' * 5,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: hexToColor('#898989'), fontSize: su.setSp(26)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: su.setWidth(20 * wFactor)),
              child: Text(
                '12.3M',
                style: TextStyle(fontSize: su.setSp(30), color: mainThemeColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
