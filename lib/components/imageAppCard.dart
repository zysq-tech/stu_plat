import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './customCard.dart';
import '../data/apps.dart';

class ImageAppCard extends StatelessWidget {
  ImageAppCard({this.width, this.height, this.data, this.bestTag, this.margin});

  final double width;
  final double height;
  final AppInfoData data;
  final bool bestTag;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final su = ScreenUtil.getInstance();
    final actaulWidth = width ?? 991;
    final actaulHeight = height ?? 890;
    return Center(
      child: CustomCard(
        width: su.setWidth(width ?? 991),
        height: su.setHeight(height ?? 890),
        borderRadius: BorderRadius.circular(su.setHeight(20)),
        margin: margin ?? EdgeInsets.symmetric(vertical: su.setHeight(18)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                CustomCard(
                  width: su.setWidth(actaulWidth),
                  height: su.setHeight((actaulHeight) - 144),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(su.setHeight(20)),
                  ),
                  color: Colors.grey,
                  image: null,
                  boxShadow: CustomCard.noneBoxShadow,
                ),
                Positioned(
                  right: su.setWidth(86),
                  child: CustomCard(
                    width: su.setWidth(114),
                    height: su.setHeight(136),
                    image: DecorationImage(
                        image: AssetImage('assets/img/bg_best.png'),
                        fit: BoxFit.fill),
                    boxShadow: CustomCard.noneBoxShadow,
                    padding: EdgeInsets.only(top: su.setHeight(10)),
                    alignment: Alignment.topCenter,
                    color: Colors.transparent,
                    child: Text(
                      '今日\n最佳',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: su.setSp(30),
                          letterSpacing: su.setWidth(6),
                          height: 1.33),
                    ),
                  ),
                ),
                Positioned(
                  bottom: su.setWidth(30),
                  child: Container(
                      width: su.setWidth(actaulWidth),
                      padding:
                          EdgeInsets.symmetric(horizontal: su.setWidth(30)),
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
                    width: su.setWidth(100),
                    height: su.setHeight(100),
                    borderRadius: BorderRadius.circular(su.setHeight(33)),
                    boxShadow: CustomCard.noneBoxShadow,
                    color: Colors.grey,
                    margin: EdgeInsets.only(
                        left: su.setWidth(30), right: su.setWidth(55)),
                    image: null,
                  ),
                  Flexible(
                      child: Text(
                    'App Name App Name App Name App Name App Name',
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: su.setSp(45), fontWeight: FontWeight.bold),
                  )),
                  Container(
                    width: su.setWidth(200),
                    margin: EdgeInsets.only(right: su.setWidth(30)),
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
    );
  }
}
