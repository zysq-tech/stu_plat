import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import './customCard.dart';
import '../data/apps.dart';

const double designWidth = 991;
const double designHeight = 890;

class ImageAppCard extends StatelessWidget {
  ImageAppCard(
      {this.width,
      this.height,
      this.data,
      this.bestTag = false,
      this.margin,
      this.onTap});

  final double width;
  final double height;
  final AppInfoData data;
  final bool bestTag;
  final EdgeInsetsGeometry margin;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil.getInstance();
    final fWidth = width ?? designWidth;
    final fHeight = height ?? designHeight;
    final wFactor = fWidth / designWidth;
    final hFactor = fHeight / designHeight;
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: CustomCard(
          width: su.setWidth(fWidth),
          height: su.setWidth(fHeight),
          borderRadius: BorderRadius.circular(su.setWidth(20 * hFactor)),
          margin: margin ??
              EdgeInsets.symmetric(vertical: su.setWidth(18 * hFactor)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CustomCard(
                    width: su.setWidth(fWidth),
                    height: su.setWidth((fHeight) - 144 * hFactor),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(su.setWidth(20 * hFactor)),
                    ),
                    color: Colors.grey,
                    image: null,
                    boxShadow: CustomCard.noneBoxShadow,
                  ),
                  Positioned(
                    right: su.setWidth(86 * wFactor),
                    child: bestTag
                        ? CustomCard(
                            width: su.setWidth(114 * wFactor),
                            height: su.setWidth(136 * hFactor),
                            image: DecorationImage(
                                image: AssetImage('assets/img/bg_best.png'),
                                fit: BoxFit.fill),
                            boxShadow: CustomCard.noneBoxShadow,
                            padding:
                                EdgeInsets.only(top: su.setWidth(10 * hFactor)),
                            alignment: Alignment.topCenter,
                            color: Colors.transparent,
                            child: Text(
                              '今日\n最佳',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: su.setSp(30),
                                  letterSpacing: su.setWidth(6 * wFactor),
                                  height: 1.33),
                            ),
                          )
                        : Container(),
                  ),
                  Positioned(
                    bottom: su.setWidth(30),
                    child: Container(
                        width: su.setWidth(fWidth),
                        padding: EdgeInsets.symmetric(
                            horizontal: su.setWidth(30 * wFactor)),
                        child: Text(
                          'Advertising slogan，Advertising slogan，Advertising slogan，Advertising slogan',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: su.setSp(50),
                              fontWeight: FontWeight.bold),
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        )),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    CustomCard(
                        width: su.setWidth(100 * wFactor),
                        height: su.setWidth(100 * hFactor),
                        borderRadius:
                            BorderRadius.circular(su.setWidth(33 * hFactor)),
                        boxShadow: CustomCard.noneBoxShadow,
                        // color: Colors.grey,
                        margin: EdgeInsets.only(
                            left: su.setWidth(30),
                            right: su.setWidth(55 * wFactor)),
                        image: getDefaultIcon()),
                    Flexible(
                        child: Text(
                      'App Name',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: su.setSp(45), fontWeight: FontWeight.bold),
                    )),
                    Container(
                      width: su.setWidth(200 * wFactor),
                      margin: EdgeInsets.only(right: su.setWidth(30 * wFactor)),
                      alignment: Alignment.center,
                      child: Text(
                        'Tag/Tag',
                        softWrap: false,
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: su.setSp(35)),
                      ),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
