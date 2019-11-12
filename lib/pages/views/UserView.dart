import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
    Application().router.navigateTo(context,
        '${Routes.login}?data=${fluroCnParamsEncode(objectToJson(LoginPageData()))}',
        clearStack: true);
  }

  void showChooseImagePopup() {
    showGeneralDialog(
        context: context,
        pageBuilder: (c, a1, a2) => Center(
              child: Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    width: su.setWidth(992),
                    height: su.setHeight(376),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(su.setHeight(40))),
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        buildUserInfoDisplay(context),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: su.setHeight(10)),
            child: Center(
              child: Column(
                children: <Widget>[
                  buildEntranceTab('帮助中心', onTap: () {}),
                  buildEntranceTab('关于产品', onTap: () {}),
                  buildEntranceTab('检查版本', onTap: () {}),
                  buildEntranceTab('意见反馈', onTap: () {}),
                  buildEntranceTab('注销账号', onTap: () {}),
                  buildLogoutBtn(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container buildUserInfoDisplay(BuildContext context) {
    return Container(
      width: su.setWidth(1080),
      height: su.setHeight(615),
      decoration: BoxDecoration(
          color: homeBgColor,
          image: DecorationImage(
              image: AssetImage('assets/img/bg_selfTop.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth)),
      padding: EdgeInsets.only(top: su.setHeight(84), bottom: su.setHeight(71)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: showChooseImagePopup,
            child: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: su.setHeight(144),
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
              Application().router.navigateTo(context,
                  '${Routes.userInfo}?data=${fluroCnParamsEncode(objectToJson(UserInfoPageData()))}');
            },
            child: CustomCard.cricleEnds(
              width: su.setWidth(153),
              height: su.setHeight(51),
              color: Colors.black.withOpacity(0.4),
              boxShadow: CustomCard.noneBoxShadow,
              child: Text(
                '完善信息',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: su.setSp(26),
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
      height: su.setHeight(139),
      boxShadow: CustomCard.noneBoxShadow,
      color: mainThemeColor,
      margin: EdgeInsets.symmetric(vertical: su.setHeight(15)),
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
      {Function onTap, TabInfoData data}) {
    return CustomCard(
      width: su.setWidth(1009),
      height: su.setHeight(233),
      borderRadius: BorderRadius.circular(su.setHeight(20)),
      margin: EdgeInsets.symmetric(vertical: su.setHeight(10)),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(25)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Row(
              children: <Widget>[
                Image.asset('assets/icon/icon_service.png',
                    width: su.setWidth(142), height: su.setHeight(142)),
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
                  height: su.setHeight(61),
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
            height: su.setHeight(185),
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
          height: su.setHeight(5),
          color: hexToColor('#dcdcdc'),
        ),
        Container(
            width: su.setWidth(992),
            height: su.setHeight(185),
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
