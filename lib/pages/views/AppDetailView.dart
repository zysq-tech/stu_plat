import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../data/apps.dart';
import '../../components/customCard.dart';

class AppDetailView extends StatefulWidget {
  AppDetailView({@required this.data});

  final AppInfoData data;

  @override
  _AppDetailViewState createState() => _AppDetailViewState();
}

class _AppDetailViewState extends State<AppDetailView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;

  TextStyle _contentStyle;
  TextStyle _titleStyle;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _contentStyle = TextStyle(
        color: hexToColor('#434343'), fontSize: su.setSp(40), height: 1.2);
    _titleStyle = TextStyle(
        color: mainThemeColor,
        fontSize: su.setSp(50),
        fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: su.setWidth(36)),
      child: Column(
        children: <Widget>[
          buildImages(),
          Container(
            width: su.setWidth(968),
            margin: EdgeInsets.symmetric(vertical: su.setWidth(32)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: su.setWidth(69)),
                  child: Text(
                    'App Description ' * 5,
                    style: _contentStyle,
                  ),
                ),
              ]
                ..addAll(buildAppIntro())
                ..addAll(buildAppUpdateIntro())
                ..addAll(buildAppInfomation()),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> buildAppIntro() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          'APP介绍',
          style: _titleStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(69)),
        child: Text(
          'App Introduction ' * 12,
          style: _contentStyle,
        ),
      ),
    ];
  }

  List<Widget> buildAppUpdateIntro() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '更新',
          style: _titleStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(69)),
        child: Text(
          'App Update Introduction ' * 12,
          style: _contentStyle,
        ),
      ),
    ];
  }

  List<Widget> buildAppInfomation() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '信息',
          style: _titleStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(69)),
        child: Text(
          'App Infomation\n' * 6,
          style: _contentStyle,
        ),
      ),
    ];
  }

  Container buildImages() {
    return Container(
      width: su.setWidth(1080),
      height: su.setHeight(807),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: su.setWidth(20)),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) => CustomCard(
          width: su.setWidth(498),
          height: su.setWidth(807),
          boxShadow: CustomCard.noneBoxShadow,
          margin: EdgeInsets.symmetric(horizontal: su.setWidth(25)),
          borderRadius: BorderRadius.circular(su.setWidth(20)),
          color: mainThemeColor.withOpacity((index + 1) / 5),
          image: null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
