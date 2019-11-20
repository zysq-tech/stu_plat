import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils.dart';
import '../Constant.dart';
import '../data/apps.dart';

const double designWidth = 885;
const double designHeight = 154;

class AppListItem extends StatelessWidget {
  AppListItem(
      {this.width,
      this.height,
      this.margin,
      this.data,
      this.showTag = true,
      this.onTap});

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final bool showTag;
  final AppInfoData data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil.getInstance();
    final fwidth = width ?? designWidth;
    final fheight = height ?? designHeight;
    final wFactor = fwidth / designWidth;
    final hFactor = fheight / designHeight;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: su.setWidth(fwidth),
          height: su.setWidth(fheight),
          padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(5), vertical: su.setWidth(5)),
          color: Colors.white.withOpacity(0.1),
          margin: margin,
          child: Row(
            children: <Widget>[
              Container(
                width: su.setWidth(144),
                height: su.setWidth(144),
                decoration: BoxDecoration(
                    image: getDefaultIcon(),
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(su.setWidth(20))),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: su.setWidth(20 * wFactor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Text(
                        'App Name',
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: hexToColor('#262626'),
                            fontSize: su.setSp(42)),
                      ),
                      Text(
                        'App main Tag',
                        style: TextStyle(
                            color: hexToColor('#262626'),
                            fontSize: su.setSp(30)),
                      ),
                      Text(
                        'App Description ' * 5,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: hexToColor('#898989'),
                            fontSize: su.setSp(34)),
                      )
                    ]..removeAt(showTag ? 0 : 2),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: su.setWidth(20)),
                child: Text(
                  '12.3M',
                  style:
                      TextStyle(fontSize: su.setSp(34), color: mainThemeColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
