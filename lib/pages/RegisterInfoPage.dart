import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stu_plat/Constant.dart';

import '../Application.dart';
import '../Utils.dart';
import '../components/customCard.dart';

class RegisterInfoPage extends StatefulWidget {
  RegisterInfoPage({@required this.type});

  final int type;

  @override
  _RegisterInfoPageState createState() => _RegisterInfoPageState();
}

class _RegisterInfoPageState extends State<RegisterInfoPage> {
  ScreenUtil su;

  bool showAppealTip = false;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '编辑${widget.type == 1 ? '学生' : '教师'}信息',
          style:
              TextStyle(fontSize: su.setSp(50), color: hexToColor('#313131')),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: su.setWidth(1080),
          height: su.setHeight(1732),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              buildTopTip(),
              CustomCard(
                width: su.setWidth(1006),
                constraints: BoxConstraints(minHeight: su.setHeight(552)),
                margin: EdgeInsets.symmetric(vertical: su.setHeight(30)),
                padding: EdgeInsets.symmetric(vertical: su.setHeight(35)),
                borderRadius: BorderRadius.circular(su.setHeight(20)),
                child: Column(
                  children: <Widget>[
                    buildInputContainer(),
                    buildInputContainer(),
                    buildInputContainer(),
                  ]..addAll(widget.type == 1
                      ? [
                          buildInputContainer(),
                          buildInputContainer(),
                        ]
                      : const []),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              buildMainBtn(),
            ]..addAll(showAppealTip ? [buildAppealTip()] : const []),
          ),
        ),
      ),
    );
  }

  Row buildAppealTip() {
    return Row(
      children: <Widget>[
        Text('您的身份信息已被注册，请'),
        FlatButton(
          child: Text('申诉'),
          padding: EdgeInsets.zero,
          onPressed: () {},
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget buildMainBtn() {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(119),
      color: mainThemeColor,
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.only(top: su.setHeight(200)),
      child: FlatButton(
        onPressed: () {},
        child: Center(
          child: Text(
            '提 交',
            style: TextStyle(
              fontSize: su.setSp(50),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopTip() {
    return Container(
        width: su.setWidth(964),
        padding: EdgeInsets.symmetric(vertical: su.setHeight(35)),
        child: Text(
          '填写信息仅用于身份认证核实，请确保信息真实有效。',
          style: TextStyle(
              fontSize: su.setSp(43),
              height: 1.3,
              color: hexToColor('#626262'),
              fontWeight: FontWeight.bold),
        ));
  }

  Widget buildInputContainer({Widget child}) {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(119),
      border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.symmetric(vertical: su.setHeight(18)),
      child: child,
    );
  }
}
