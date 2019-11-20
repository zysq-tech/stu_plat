import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Application.dart';
import '../../components/customCard.dart';
import '../../data/apps.dart';
import '../../data/page_data.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;

  File _avatarImage;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
  }

  void logout() {
    Application()
        .navigateTo(context, Routes.login, LoginPageData(), clearStack: true);
  }

  void showChooseImagePopup() {
    showGeneralDialog(
        context: context,
        pageBuilder: (c, a1, a2) => Center(
              child: Material(
                color: Colors.transparent,
                child: Container(
                    width: su.setWidth(992),
                    height: su.setWidth(376),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(su.setWidth(40))),
                    child: buildChooseImageOptions()),
              ),
            ),
        barrierColor: Colors.black.withOpacity(0.2),
        barrierDismissible: true,
        barrierLabel: 'barrier',
        transitionDuration: Duration(milliseconds: 200));
  }

  void selectAvatar(ImageSource source) async {
    Navigator.of(context).canPop() ? Navigator.pop(context) : print('no popup');
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _avatarImage = image;
      });
    }
  }

  void showCheckVersionPopup() {
    Alert(
        context: context,
        type: AlertType.none,
        title: '您已更新到最新版本',
        style: AlertStyle(
            isCloseButton: false,
            animationType: AnimationType.grow,
            titleStyle: TextStyle(
                color: hexToColor('#434343'),
                fontSize: su.setSp(50),
                fontWeight: FontWeight.bold)),
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '确定',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: su.setSp(40),
                  fontWeight: FontWeight.bold),
            ),
            color: mainThemeColor,
            radius: BorderRadius.circular(su.setWidth(20)),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildUserInfoDisplay(context),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: su.setWidth(10)),
              child: Center(
                child: Column(
                  children: <Widget>[
                    buildEntranceTab('帮助中心',
                        leadingPath: 'assets/icon/icon_helpCenter.png',
                        onTap: () {
                      Application().navigateTo(
                          context, Routes.helpCenter, HelpCenterPageData());
                    }),
                    buildEntranceTab('关于产品',
                        leadingPath: 'assets/icon/icon_about.png', onTap: () {
                      Application().navigateTo(
                          context,
                          Routes.web,
                          WebPageData(
                              url: 'https://zysqtech.netlify.com/about/',
                              title: '关于产品'));
                    }),
                    buildEntranceTab('检查版本',
                        leadingPath: 'assets/icon/icon_checkVersion.png',
                        onTap: showCheckVersionPopup),
                    buildEntranceTab('意见反馈',
                        leadingPath: 'assets/icon/icon_feedback.png',
                        onTap: () {
                      Application().navigateTo(
                          context, Routes.feedback, FeedbackPageData());
                    }),
                    buildEntranceTab('注销账号',
                        leadingPath: 'assets/icon/icon_unregister.png',
                        onTap: () {
                      Application().navigateTo(
                          context, Routes.unregister, UnregisterPageData());
                    }),
                    buildLogoutBtn(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildUserInfoDisplay(BuildContext context) {
    return Container(
      width: su.setWidth(1080),
      height: su.setWidth(615),
      decoration: BoxDecoration(
          color: homeBgColor,
          image: DecorationImage(
              image: AssetImage('assets/img/bg_selfTop.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth)),
      padding: EdgeInsets.only(top: su.setWidth(60), bottom: su.setWidth(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: showChooseImagePopup,
            child: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: su.setWidth(144),
              backgroundImage: null,
            ),
          ),
          Text(
            'User Name',
            softWrap: false,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Colors.white,
                fontSize: su.setSp(50),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Application()
                  .navigateTo(context, Routes.userInfo, UserInfoPageData());
            },
            child: CustomCard.cricleEnds(
              width: su.setWidth(180),
              height: su.setWidth(68),
              color: Colors.black.withOpacity(0.4),
              boxShadow: CustomCard.noneBoxShadow,
              child: Text(
                '完善信息',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: su.setSp(34),
                    letterSpacing: su.setWidth(2.6)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLogoutBtn() {
    return CustomCard.cricleEnds(
      width: su.setWidth(862),
      height: su.setWidth(139),
      boxShadow: CustomCard.noneBoxShadow,
      color: mainThemeColor,
      margin: EdgeInsets.symmetric(vertical: su.setWidth(25)),
      child: FlatButton(
        onPressed: logout,
        child: Center(
          child: Text(
            '退出登录',
            style: TextStyle(
                color: Colors.white,
                fontSize: su.setSp(50),
                fontWeight: FontWeight.bold,
                letterSpacing: su.setWidth(5)),
          ),
        ),
      ),
    );
  }

  Widget buildEntranceTab(String tempLabel,
      {@required String leadingPath, Function onTap, TabInfoData data}) {
    return CustomCard(
      width: su.setWidth(1009),
      height: su.setWidth(233),
      borderRadius: BorderRadius.circular(su.setWidth(20)),
      margin: EdgeInsets.symmetric(vertical: su.setWidth(10)),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(25)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Row(
              children: <Widget>[
                Container(
                  width: su.setWidth(130),
                  height: su.setWidth(130),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon/icon_iconBg.png'),
                          fit: BoxFit.contain)),
                  alignment: Alignment.center,
                  child: Image.asset(leadingPath,
                      width: su.setWidth(96), height: su.setWidth(96)),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: su.setWidth(76)),
                    child: Text(
                      tempLabel,
                      style: TextStyle(
                          color: hexToColor('#313131'),
                          fontSize: su.setSp(50),
                          fontWeight: FontWeight.bold,
                          letterSpacing: su.setWidth(5)),
                    ),
                  ),
                ),
                Image.asset(
                  ('assets/icon/icon_forward.png'),
                  width: su.setWidth(33),
                  height: su.setWidth(61),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildChooseImageOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: su.setWidth(992),
            height: su.setWidth(185),
            child: FlatButton(
              onPressed: () => selectAvatar(ImageSource.gallery),
              child: Center(
                child: Text('手机相册',
                    style: TextStyle(
                        color: mainThemeColor,
                        fontSize: su.setSp(60),
                        fontWeight: FontWeight.bold)),
              ),
            )),
        Container(
          width: su.setWidth(992),
          height: su.setWidth(5),
          color: hexToColor('#dcdcdc'),
        ),
        Container(
            width: su.setWidth(992),
            height: su.setWidth(185),
            child: FlatButton(
              onPressed: () => selectAvatar(ImageSource.camera),
              child: Center(
                child: Text('拍摄',
                    style: TextStyle(
                        color: hexToColor('#e16c65'),
                        fontSize: su.setSp(60),
                        fontWeight: FontWeight.bold)),
              ),
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
