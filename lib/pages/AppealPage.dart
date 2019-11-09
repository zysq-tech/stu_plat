import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../Application.dart';
import '../components/customCard.dart';
import '../data/page_data.dart';

enum AppealPageState { displayInfo, selectImage }

class AppealPage extends StatefulWidget {
  AppealPage({@required this.data});

  final AppealPageData data;

  @override
  _AppealPageState createState() => _AppealPageState();
}

class _AppealPageState extends State<AppealPage> {
  ScreenUtil su;

  String tip1 = '请您确认下面消息，是否准确无误，如需修改请返回上一页重新编辑。确认信息无误后，提交审核。 ';
  String tip2 = '1.本人手持本人学生证\n2.面部不能有遮挡。\n3.学生证件信息清晰可见，不能有遮挡，不能模糊';

  File pickedImage;

  AppealPageState _pageState;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _pageState = AppealPageState.displayInfo;
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = image ?? pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: Image.asset(
            'assets/icon/icon_return.png',
            width: su.setWidth(33),
            height: su.setHeight(61),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: su.setHeight(38),
          ),
          Expanded(
            child: Center(child: buildMainBtn()),
          )
        ]..insertAll(
            1,
            _pageState == AppealPageState.displayInfo
                ? [buildTip(tip1), buildInfoCard()]
                : [
                    Container(
                      width: su.setWidth(964),
                      margin: EdgeInsets.only(bottom: su.setHeight(50)),
                      child: Text(
                        '要求：',
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          color: hexToColor('#626262'),
                          fontSize: su.setSp(50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    buildTip(tip2),
                    buildSelectImage()
                  ]),
      ),
    );
  }

  Widget buildTip(String tip) {
    return Container(
      width: su.setWidth(964),
      child: Text(
        tip,
        style: TextStyle(
            color: hexToColor('#626262'),
            fontSize: su.setSp(43),
            fontWeight: FontWeight.bold,
            height: 1.3),
      ),
    );
  }

  Widget buildSelectImage() {
    return Container(
      width: su.setWidth(1006),
      margin: EdgeInsets.only(top: su.setHeight(246)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomCard(
            width: su.setWidth(241),
            height: su.setHeight(97),
            color: mainThemeColor,
            borderRadius: BorderRadius.circular(su.setHeight(20)),
            boxShadow: CustomCard.noneBoxShadow,
            child: InkWell(
              onTap: pickImage,
              child: Text(
                '上传照片',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: su.setSp(43)),
              ),
            ),
          ),
          CustomCard(
            width: su.setWidth(1006),
            height: su.setHeight(528),
            borderRadius: BorderRadius.circular(su.setHeight(20)),
            margin: EdgeInsets.symmetric(vertical: su.setHeight(33)),
            image: pickedImage != null
                ? DecorationImage(
                    image: FileImage(pickedImage), fit: BoxFit.contain)
                : null,
          )
        ],
      ),
    );
  }

  CustomCard buildInfoCard() {
    var data = widget.data;
    return CustomCard(
      width: su.setWidth(1006),
      height: su.setHeight(851),
      borderRadius: BorderRadius.circular(su.setHeight(20)),
      margin: EdgeInsets.symmetric(vertical: su.setHeight(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildDisplayContainer('手机号', data.phone),
          buildDisplayContainer('身份', data.type == 1 ? '学生' : '教师'),
          buildDisplayContainer('学校', fluroCnParamsDecode(data.school)),
          buildDisplayContainer('证件号码', data.code),
          buildDisplayContainer('姓名', data.name),
        ],
      ),
    );
  }

  CustomCard buildMainBtn() {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(119),
      color: mainThemeColor,
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.only(top: su.setHeight(200)),
      child: FlatButton(
        onPressed: () {
          if (_pageState == AppealPageState.displayInfo)
            setState(() {
              _pageState = AppealPageState.selectImage;
            });
          else {
            //TODO show appeal success dialog
          }
        },
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

  Widget buildDisplayContainer(String header, String info) {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(119),
      border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.symmetric(vertical: su.setHeight(18)),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$header:',
            style: TextStyle(
                color: hexToColor('#313131'),
                fontSize: su.setSp(45),
                fontWeight: FontWeight.bold),
          ),
          Text(
            info,
            style: TextStyle(
                color: hexToColor('#bfbfbf'),
                fontSize: su.setSp(40),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
