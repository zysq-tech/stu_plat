import 'package:expandable/expandable.dart';
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
        child: ExpandablePanel(
          tapHeaderToExpand: false,
          iconColor: mainThemeColor,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          header: Text(
            'App Tag',
            style: _contentStyle,
          ),
          collapsed: Text(
            'App Introduction ' * 12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: _contentStyle,
          ),
          expanded: Text(
            'App Introduction ' * 20,
            style: _contentStyle,
          ),
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
        child: ExpandablePanel(
          tapHeaderToExpand: false,
          iconColor: mainThemeColor,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          header: Text(
            'App Tag',
            style: _contentStyle,
          ),
          collapsed: Text(
            'App Update Introduction ' * 12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: _contentStyle,
          ),
          expanded: Text(
            'App Update Introduction ' * 20,
            style: _contentStyle,
          ),
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
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '资费  提供应用内购买项目',
          style: _contentStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '大小  0.0M',
          style: _contentStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '版本  1.0.1',
          style: _contentStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '时间  2019/10/10',
          style: _contentStyle,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: su.setWidth(30)),
        child: Text(
          '开发  某某科技有限公司',
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
