import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../components/customCard.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({this.data});

  final UserInfoPageData data;

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  ScreenUtil su;

  Color _color1 = hexToColor('#959595');

  TextStyle _greyTextStyle;

  FocusNode _pageFocus = FocusNode();

  TextEditingController nickNameController = TextEditingController();
  FocusNode nickNameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _greyTextStyle = TextStyle(
        color: hexToColor('#626262'),
        fontSize: su.setSp(40),
        fontWeight: FontWeight.bold);
    nickNameController.text = widget.data.nickName ?? '';
  }

  void saveNickName() {
    emptyFocus();
  }

  void tryUpdatePhoneOrEmail(int type) {
    emptyFocus();
    Application()
        .navigateTo(
            context, Routes.editPhoneEmail, EditPhoneEmailPageData(type: type))
        .then((bo) => print(bo));
  }

  void emptyFocus() {
    FocusScope.of(context).requestFocus(_pageFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '编辑个人信息',
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
      body: GestureDetector(
        onTap: emptyFocus,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
              child: Column(
            children: <Widget>[
              buildNickNameCard(),
              CustomCard(
                width: su.setWidth(1006),
                height: su.setWidth(514),
                borderRadius: BorderRadius.circular(su.setWidth(20)),
                margin: EdgeInsets.symmetric(vertical: su.setWidth(12)),
                padding: EdgeInsets.symmetric(horizontal: su.setWidth(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '账号认证',
                          style: TextStyle(
                              color: _color1,
                              fontSize: su.setSp(43),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    buildInputContainer('手机号',
                        mainChild: Text(
                          hidePhone('12345678901'),
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: _greyTextStyle,
                        ),
                        onTap: () => tryUpdatePhoneOrEmail(1)),
                    buildInputContainer('邮箱',
                        mainChild: Text(
                          hideEmail('some_email@123.com'),
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: _greyTextStyle,
                        ),
                        onTap: () => tryUpdatePhoneOrEmail(2)),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  CustomCard buildNickNameCard() {
    return CustomCard(
      width: su.setWidth(1006),
      height: su.setWidth(315),
      borderRadius: BorderRadius.circular(su.setWidth(20)),
      margin: EdgeInsets.symmetric(vertical: su.setWidth(25)),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '基本信息',
                style: TextStyle(
                    color: _color1,
                    fontSize: su.setSp(43),
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: saveNickName,
                child: CustomCard.cricleEnds(
                  width: su.setWidth(179),
                  height: su.setWidth(75),
                  boxShadow: CustomCard.noneBoxShadow,
                  border:
                      Border.all(color: mainThemeColor, width: su.setWidth(3)),
                  child: Text(
                    '保存',
                    style: TextStyle(
                        color: mainThemeColor,
                        fontSize: su.setSp(40),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          buildInputContainer('昵称',
              mainChild: buildTextField(
                nickNameController,
                nickNameFocus,
              )),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, FocusNode focusNode,
      {String hintText,
      int lengthLimit = 10,
      List<TextInputFormatter> additionalInputFormatter = const [],
      bool enable = true}) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: _greyTextStyle,
      enabled: enable,
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthLimit),
      ]..addAll(additionalInputFormatter),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: _greyTextStyle,
          hintText: hintText),
    );
  }

  Widget buildInputContainer(String header,
      {Widget mainChild, Function onTap}) {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setWidth(119),
      border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.symmetric(vertical: su.setWidth(18)),
      child: MaterialButton(
        onPressed: onTap,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: su.setWidth(25)),
              child: Text(
                '$header:',
                style: TextStyle(
                    color: hexToColor('#313131'),
                    fontSize: su.setSp(45),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: mainChild ?? Container()),
            Image.asset(
              'assets/icon/icon_edit.png',
              width: su.setWidth(47),
              height: su.setWidth(51),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nickNameController.dispose();
    nickNameFocus.dispose();
    _pageFocus.dispose();

    super.dispose();
  }
}
