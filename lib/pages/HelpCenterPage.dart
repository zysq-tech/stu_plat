import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../data/other.dart';
import '../components/customCard.dart';

class HelpCenterPage extends StatefulWidget {
  HelpCenterPage({@required this.data});

  final HelpCenterPageData data;

  @override
  _HelpCenterPageState createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  ScreenUtil su;

  List<int> questions;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    questions = List<int>.generate(10, (i) => i + 1);
  }

  void showServicePanel() {
    Alert(
      type: AlertType.none,
      context: context,
      title: '欢迎您的咨询，大学生应用宝竭诚为您服务。添加QQ群：$serviceQQ 在线为您答疑解惑',
      style: AlertStyle(
        isCloseButton: false,
        animationType: AnimationType.fromBottom,
        titleStyle: TextStyle(
          color: hexToColor('#434343'),
          fontSize: su.setSp(50),
        ),
      ),
      buttons: [
        DialogButton(
            width: su.setWidth(253),
            height: su.setWidth(124),
            color: mainThemeColor,
            radius: BorderRadius.circular(su.setWidth(20)),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: serviceQQ)).then((d) {
                Navigator.pop(context);
                showToast('复制成功');
              });
            },
            child: Text(
              '复制',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: su.setSp(40),
                  fontWeight: FontWeight.bold),
            )),
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '帮助中心',
          style:
              TextStyle(fontSize: su.setSp(50), color: hexToColor('#313131')),
        ),
        leading: MaterialButton(
          child: Image.asset(
            'assets/icon/icon_return.png',
            width: su.setWidth(33),
            height: su.setWidth(61),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: su.setWidth(40), horizontal: su.setWidth(50)),
              width: su.setWidth(1080),
              child: Text(
                '常见问题',
                style: TextStyle(
                    color: hexToColor('#434343'),
                    fontSize: su.setSp(43),
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: showServicePanel,
              child: Text(
                '在线客服',
                style: TextStyle(color: mainThemeColor, fontSize: su.setSp(35)),
              ),
            )
          ]..insertAll(1, questions.map((i) => buildExpandableCard(i))),
        ),
      ),
    );
  }

  Widget buildExpandableCard(int i) {
    return CustomCard(
      width: su.setWidth(1010),
      borderRadius: BorderRadius.circular(su.setWidth(20)),
      margin: EdgeInsets.symmetric(vertical: su.setWidth(15)),
      padding: EdgeInsets.symmetric(vertical: su.setWidth(28)),
      child: ExpandablePanel(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        header: buildQuestionTitle('Question $i'),
        expanded: buildQuestionDescription('Description $i'),
      ),
    );
  }

  Widget buildQuestionTitle(String q) {
    return Padding(
      padding: EdgeInsets.only(left: su.setWidth(30)),
      child: Text(
        q,
        style: TextStyle(
            color: hexToColor('#434343'),
            fontSize: su.setSp(40),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  CustomCard buildQuestionDescription(String desc) {
    return CustomCard(
      width: su.setWidth(929),
      borderRadius: BorderRadius.circular(su.setWidth(20)),
      color: hexToColor('#f1eff0'),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: su.setWidth(66)),
      boxShadow: CustomCard.noneBoxShadow,
      padding: EdgeInsets.symmetric(
          horizontal: su.setWidth(33), vertical: su.setWidth(54)),
      child: Text(
        desc,
        style: TextStyle(color: hexToColor('#707070'), fontSize: su.setSp(35)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
