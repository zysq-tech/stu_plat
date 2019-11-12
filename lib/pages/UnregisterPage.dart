import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../components/customCard.dart';

class UnregisterPage extends StatefulWidget {
  UnregisterPage({@required this.data});

  final UnregisterPageData data;

  @override
  _UnregisterPageState createState() => _UnregisterPageState();
}

class _UnregisterPageState extends State<UnregisterPage> {
  ScreenUtil su;

  Color _color1 = hexToColor('#626262');

  TextStyle _greyTextStyle;

  Timer _getCodeTimer;
  int _getCodeCountDown;

  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  FocusNode codeFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  FocusNode _pageFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _greyTextStyle = TextStyle(
        color: _color1, fontSize: su.setSp(40), fontWeight: FontWeight.bold);
  }

  void getCode() {
    if (_getCodeTimer?.isActive == true) return;
    _getCodeCountDown = getCodeCountDown;
    _getCodeTimer = Timer.periodic(
        const Duration(milliseconds: 1000),
        (timer) => setState(() {
              --_getCodeCountDown;
              if (_getCodeCountDown <= 0) {
                timer.cancel();
              }
            }));
    setState(() {});
  }

  void tryUnregister() {
    Alert(
      type: AlertType.warning,
      context: context,
      title: '账号注销确认',
      desc: '注销后，账号信息及账号内所有将无法找回',
      style: AlertStyle(
          isCloseButton: false,
          animationType: AnimationType.grow,
          titleStyle: TextStyle(
              color: hexToColor('#434343'),
              fontSize: su.setSp(50),
              fontWeight: FontWeight.bold),
          descStyle: TextStyle(fontSize: su.setSp(43), color: _color1)),
      buttons: [
        DialogButton(
            width: su.setWidth(253),
            height: su.setHeight(124),
            color: mainThemeColor,
            radius: BorderRadius.circular(su.setHeight(20)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '暂不注销',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: su.setSp(35),
                  fontWeight: FontWeight.bold),
            )),
        DialogButton(
            width: su.setWidth(253),
            height: su.setHeight(124),
            color: Colors.red,
            radius: BorderRadius.circular(su.setHeight(20)),
            onPressed: () {
              var str = fluroCnParamsEncode(objectToJson(LoginPageData()));
              Application().router.navigateTo(
                  context, '${Routes.login}?data=$str',
                  clearStack: true);
            },
            child: Text(
              '确定注销',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: su.setSp(35),
                  fontWeight: FontWeight.bold),
            ))
      ],
    ).show();
  }

  void emptyFocus() {
    FocusScope.of(context).requestFocus(_pageFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '注销账号',
          style:
              TextStyle(fontSize: su.setSp(50), color: hexToColor('#313131')),
        ),
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
      body: GestureDetector(
        onTap: emptyFocus,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: su.setHeight(30)),
          physics: NeverScrollableScrollPhysics(),
          child: Center(
              child: Column(
            children: buildTip()
              ..addAll(buildInputs())
              ..add(CustomCard.cricleEnds(
                width: su.setWidth(944),
                height: su.setHeight(119),
                color: mainThemeColor,
                boxShadow: CustomCard.noneBoxShadow,
                margin: EdgeInsets.only(top: su.setHeight(150)),
                child: FlatButton(
                  onPressed: tryUnregister,
                  child: Center(
                    child: Text(
                      '申请注销',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: su.setSp(50),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          )),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      buildInputContainer(
          header: '手机号:',
          mainChild: buildTextField(phoneController, phoneFocus,
              hintText: '请输入',
              lengthLimit: 11,
              additionalInputFormatter: [
                WhitelistingTextInputFormatter.digitsOnly
              ]),
          tail: Container()),
      buildInputContainer(
          mainChild: buildTextField(codeController, codeFocus,
              hintText: '请输入验证码',
              lengthLimit: 6,
              additionalInputFormatter: [
                WhitelistingTextInputFormatter.digitsOnly
              ]),
          tail: GestureDetector(
            onTap: getCode,
            child: CustomCard.cricleEnds(
              width: su.setWidth(240),
              height: su.setHeight(76),
              boxShadow: CustomCard.noneBoxShadow,
              color: mainThemeColor,
              child: Text(
                _getCodeTimer?.isActive == true
                    ? '$_getCodeCountDown'
                    : '获取验证码',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: su.setSp(40),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
      buildInputContainer(
          header: '姓名:',
          mainChild: buildTextField(nameController, nameFocus, lengthLimit: 10),
          tail: Container()),
    ];
  }

  List<Widget> buildTip() {
    return <Widget>[
      Image.asset(
        'assets/icon/icon_warning.png',
        width: su.setWidth(348),
        height: su.setHeight(348),
      ),
      Padding(
        padding: EdgeInsets.only(top: su.setHeight(43)),
        child: Text(
          '申请注销账号',
          style: TextStyle(
              color: _color1,
              fontSize: su.setSp(55),
              fontWeight: FontWeight.bold,
              letterSpacing: su.setWidth(5.5)),
        ),
      ),
      Container(
        width: su.setWidth(936),
        margin: EdgeInsets.only(top: su.setHeight(87)),
        child: Text(
          '在注销账号前，请完整且准确填写身份信息，以确保为本人操作',
          style: TextStyle(
              color: _color1,
              fontSize: su.setSp(43),
              fontWeight: FontWeight.bold,
              letterSpacing: su.setWidth(4.3)),
        ),
      ),
    ];
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
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthLimit),
      ]..addAll(additionalInputFormatter),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: _greyTextStyle,
          hintText: hintText),
    );
  }

  Widget buildInputContainer(
      {String header = '', Widget mainChild, Widget tail, Function onTap}) {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(120),
      border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.only(top: su.setHeight(40)),
      child: MaterialButton(
        onPressed: onTap,
        child: Row(
          children: <Widget>[
            Text(
              '$header',
              style: TextStyle(
                  color: hexToColor('#313131'),
                  fontSize: su.setSp(45),
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: su.setWidth(25)),
              child: mainChild ?? Container(),
            )),
            tail ??
                Image.asset(
                  'assets/icon/icon_edit.png',
                  width: su.setWidth(47),
                  height: su.setHeight(51),
                )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    phoneFocus.dispose();
    codeController.dispose();
    codeFocus.dispose();
    nameController.dispose();
    nameFocus.dispose();

    _pageFocus.dispose();
    _getCodeTimer?.cancel();
    super.dispose();
  }
}
