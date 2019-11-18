import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Application.dart';
import '../components/customCard.dart';
import '../data/page_data.dart';

enum LoginPageState {
  personalLogin,
  groupLogin,
  forgetPassword_getCode,
  forgetPassword_setPassword,
  register_getCode,
  register_setPassword,
  register_chooseInfoType,
}

class LoginPage extends StatefulWidget {
  LoginPage({@required this.data});

  final LoginPageData data;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  LoginPageState _pageState;

  TabController _tabController;
  int _tabIndex = 0;

  ProgressDialog pr;

  ScreenUtil su;

  Timer _getCodeTimer;
  int _getCodeCountDown;

  bool get canGetCode => _getCodeCountDown == null || _getCodeCountDown <= 0;

  FocusNode pageFocusNode = FocusNode();

  TextEditingController firstInputController = TextEditingController();
  TextEditingController secondInputController = TextEditingController();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();

  bool termsChecked = true;

  String pleaseInputPhone = '请输入手机号码';
  String pleaseInputPassword = '请输入密码';
  String pleaseInputPasswordAgain = '请再次输入密码';
  String pleaseInputAccount = '请输入账号';
  String pleaseInputCode = '请输入验证码';

  String get firstHint => _pageState == LoginPageState.groupLogin
      ? pleaseInputAccount
      : isSetPasswordState ? pleaseInputPassword : pleaseInputPhone;

  String get secondHint => isSetPasswordState
      ? pleaseInputPasswordAgain
      : isCodeState ? pleaseInputCode : pleaseInputPassword;

  bool get showTermsLine =>
      _pageState == LoginPageState.groupLogin ||
      _pageState == LoginPageState.personalLogin;

  bool get isCodeState =>
      _pageState == LoginPageState.register_getCode ||
      _pageState == LoginPageState.forgetPassword_getCode;

  bool get isSetPasswordState =>
      _pageState == LoginPageState.forgetPassword_setPassword ||
      _pageState == LoginPageState.register_setPassword;

  @override
  void initState() {
    super.initState();
    _pageState = LoginPageState.personalLogin;
    su = Application().screenUtil;
    _tabIndex = 0;
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: _tabIndex);
  }

  void onTapTab(int index) {
    if (_pageState == LoginPageState.personalLogin ||
        _pageState == LoginPageState.groupLogin) {
      if (index != _tabIndex) {
        _tabIndex = index;
        setState(() {
          _pageState = index == 0
              ? LoginPageState.personalLogin
              : LoginPageState.groupLogin;
        });
      }
    }
    clearFocus();
  }

  void sendCode() {
    if (!canGetCode) return;
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

  void tryLogin() {
    // showAccountErrorDialog();
    Application().router.navigateTo(context,
        '${Routes.home}?data=${fluroCnParamsEncode(objectToJson(HomePageData()))}',
        clearStack: true);
  }

  void afterGetCode() {
    setState(() {
      if (_pageState == LoginPageState.forgetPassword_getCode) {
        _pageState = LoginPageState.forgetPassword_setPassword;
      } else if (_pageState == LoginPageState.register_getCode) {
        _pageState = LoginPageState.register_setPassword;
      }
    });
  }

  void afterForgetPassword() {
    setState(() {
      _pageState = LoginPageState.personalLogin;
    });
  }

  void afterRegisterPassword() {
    setState(() {
      _pageState = LoginPageState.register_chooseInfoType;
    });
  }

  void showAccountErrorDialog() {
    Alert(
        // type: AlertType.error,
        context: context,
        title: '账号异常',
        desc:
            '请于48小时内，与客服联系处理异常，48小时候，将视为自动放弃申辩权利系统将自动注销您的账号，据实将无法找回，电话15512341234',
        style: AlertStyle(
            isCloseButton: false,
            animationType: AnimationType.grow,
            titleStyle: TextStyle(
                color: hexToColor('#f86b76'),
                fontSize: su.setSp(50),
                fontWeight: FontWeight.bold),
            descStyle: TextStyle(
                fontSize: su.setSp(43), color: hexToColor('#626262'))),
        buttons: [],
        closeFunction: () {
          print('close');
        }).show();
  }

  void onTapInfoOption(int type) {
    Application().router.navigateTo(context,
        '${Routes.registerInfo}?data=${fluroCnParamsEncode(objectToJson(RegisterInfoPageData(type: type)))}');
  }

  void clearFocus() {
    FocusScope.of(context).requestFocus(pageFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: clearFocus,
          child: Container(
            color: Colors.white,
            width: su.setWidth(1080),
            height: su.setHeight(1920),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(height: su.setHeight(47)),
                Container(
                  width: su.setHeight(316),
                  height: su.setHeight(316),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(su.setHeight(40)),
                      // color: hexToColor('#626262'),
                      image: getDefaultIcon()),
                ),
                CustomCard(
                  width: su.setWidth(961),
                  height: su.setHeight(1384),
                  borderRadius: BorderRadius.circular(su.setHeight(40)),
                  child: Column(
                    children: _pageState ==
                            LoginPageState.register_chooseInfoType
                        ? [
                            Container(
                              height: su.setHeight(120),
                            ),
                            buildInfoOptionBtn(
                                '填写学生信息', () => onTapInfoOption(1)),
                            buildInfoOptionBtn(
                                '填写教师信息', () => onTapInfoOption(2)),
                          ]
                        : [
                            buildTabBar(),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: su.setHeight(15)),
                                child: Column(
                                  children: <Widget>[
                                    buildFirstInput(),
                                    buildSecondInput(),
                                    buildMainBtn(),
                                  ]
                                    ..addAll(showTermsLine
                                        ? [buildTermsLine()]
                                        : const [])
                                    ..addAll(_pageState ==
                                            LoginPageState.personalLogin
                                        ? [
                                            buildForgetBtn(),
                                            buildDivider(),
                                            Expanded(
                                              child: Center(
                                                child: buildRegisterBtn(),
                                              ),
                                            )
                                          ]
                                        : const []),
                                ),
                              ),
                            )
                          ],
                  ),
                ),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoOptionBtn(String text, Function onTap) {
    return CustomCard.cricleEnds(
      width: su.setWidth(877),
      height: su.setHeight(145),
      color: mainThemeColor,
      margin: EdgeInsets.symmetric(vertical: su.setHeight(26)),
      child: FlatButton(
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: su.setSp(40),
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildFirstInput() {
    return buildInputCard(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: su.setWidth(60)),
          child: Image.asset(
            'assets/icon/icon_user.png',
            width: su.setWidth(57),
            height: su.setHeight(65),
          ),
        ),
        Expanded(child: buildFirstTextField())
      ],
    ));
  }

  Widget buildSecondInput() {
    return buildInputCard(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: su.setWidth(60)),
          child: Image.asset(
            'assets/icon/icon_password.png',
            width: su.setWidth(58),
            height: su.setHeight(60),
          ),
        ),
        Expanded(child: buildSecondTextField()),
        isCodeState
            ? buildGetCodeBtn()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: su.setWidth(60)),
                child: Image.asset(
                  'assets/icon/icon_eye.png',
                  width: su.setWidth(56),
                  height: su.setHeight(36),
                ),
              ),
      ],
    ));
  }

  Widget buildGetCodeBtn() {
    return GestureDetector(
      child: CustomCard.cricleEnds(
        width: su.setWidth(206),
        height: su.setHeight(79),
        margin: EdgeInsets.symmetric(horizontal: su.setWidth(16)),
        boxShadow: CustomCard.noneBoxShadow,
        color: canGetCode ? mainThemeColor : Colors.grey,
        child: Text(
          canGetCode ? '获取验证码' : '($_getCodeCountDown)',
          style: TextStyle(
              color: Colors.white,
              fontSize: su.setSp(30),
              fontWeight: FontWeight.bold),
        ),
      ),
      onTap: sendCode,
    );
  }

  Widget buildFirstTextField() {
    return TextField(
      controller: firstInputController,
      focusNode: firstFocusNode,
      inputFormatters: [LengthLimitingTextInputFormatter(30)],
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: firstHint,
          hintStyle: TextStyle(
              fontSize: su.setSp(40),
              color: hexToColor(
                '#dcdcdc',
              ),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget buildSecondTextField() {
    return TextField(
      controller: secondInputController,
      focusNode: secondFocusNode,
      inputFormatters: [LengthLimitingTextInputFormatter(20)],
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: secondHint,
          hintStyle: TextStyle(
              fontSize: su.setSp(40),
              color: hexToColor(
                '#dcdcdc',
              ),
              fontWeight: FontWeight.bold)),
    );
  }

  Widget buildRegisterBtn() {
    return FlatButton(
      child: Text(
        '注册新用户',
        style: TextStyle(
            color: mainThemeColor,
            fontSize: su.setSp(50),
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        setState(() {
          _pageState = LoginPageState.register_getCode;
        });
      },
    );
  }

  Widget buildDivider() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            indent: su.setWidth(30),
            endIndent: su.setHeight(20),
            thickness: 2,
            color: hexToColor('#d2d2d2'),
          ),
        ),
        Text(
          'or',
          style: TextStyle(color: mainThemeColor, fontSize: su.setSp(35)),
        ),
        Expanded(
          child: Divider(
            endIndent: su.setWidth(30),
            indent: su.setHeight(20),
            thickness: 2,
            color: hexToColor('#d2d2d2'),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  FlatButton buildForgetBtn() {
    return FlatButton(
      child: Text(
        '忘记密码?',
        style: TextStyle(fontSize: su.setSp(40), fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        setState(() {
          _pageState = LoginPageState.forgetPassword_getCode;
        });
      },
      padding: EdgeInsets.zero,
    );
  }

  Widget buildTermsLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: su.setWidth(50),
            height: su.setHeight(50),
            margin: EdgeInsets.all(su.setWidth(25)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: termsChecked ? mainThemeColor : Colors.grey),
            child: Icon(
              Icons.check,
              size: su.setHeight(40),
              color: Colors.white,
            ),
          ),
          onTap: () {
            setState(() {
              termsChecked = !termsChecked;
            });
          },
        ),
        Text('登录即代表您同意',
            style: TextStyle(
                fontSize: su.setSp(35),
                color: hexToColor('#a0a0a0'),
                fontWeight: FontWeight.bold)),
        FlatButton(
          child: Text('《致远思齐条款》',
              style: TextStyle(
                  fontSize: su.setSp(35),
                  color: mainThemeColor,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
            var str = fluroCnParamsEncode(objectToJson(WebPageData(
                url: 'https://zysqtech.netlify.com/terms/', title: '致远思齐条款')));
            Application().router.navigateTo(context, '${Routes.web}?data=$str');
          },
          padding: EdgeInsets.zero,
        )
      ],
    );
  }

  Widget buildMainBtn() {
    return GestureDetector(
      onTap: () {
        switch (_pageState) {
          case LoginPageState.personalLogin:
          case LoginPageState.groupLogin:
            tryLogin();
            break;
          case LoginPageState.forgetPassword_getCode:
          case LoginPageState.register_getCode:
            afterGetCode();
            break;
          case LoginPageState.forgetPassword_setPassword:
            afterForgetPassword();
            break;
          case LoginPageState.register_setPassword:
            afterRegisterPassword();
            break;
          default:
            break;
        }
      },
      child: CustomCard.cricleEnds(
        width: su.setWidth(877),
        height: su.setHeight(145),
        color: mainThemeColor,
        boxShadow: CustomCard.noneBoxShadow,
        margin: EdgeInsets.symmetric(vertical: su.setHeight(20)),
        child: Text(
          '确 定',
          style: TextStyle(
              fontSize: su.setSp(60),
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Padding(
      padding: EdgeInsets.only(top: su.setHeight(40)),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        onTap: onTapTab,
        tabs: <Widget>[
          Tab(
            child: CustomCard.cricleEnds(
              width: su.setWidth(225),
              height: su.setHeight(88),
              color: _tabIndex == 0 ? mainThemeColor : Colors.white,
              child: Text(
                '个 人',
                style: TextStyle(
                    color: _tabIndex == 0 ? Colors.white : Colors.black,
                    fontSize: su.setSp(40),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Tab(
            child: CustomCard.cricleEnds(
              width: su.setWidth(225),
              height: su.setHeight(88),
              color: _tabIndex == 1 ? mainThemeColor : Colors.white,
              child: Text(
                '团 体',
                style: TextStyle(
                    color: _tabIndex == 1 ? Colors.white : Colors.black,
                    fontSize: su.setSp(40),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputCard({Widget child}) {
    return CustomCard.cricleEnds(
      width: su.setWidth(877),
      height: su.setHeight(145),
      margin: EdgeInsets.symmetric(vertical: su.setHeight(25)),
      child: child,
    );
  }

  @override
  void dispose() {
    firstInputController.dispose();
    secondInputController.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    pageFocusNode.dispose();
    _getCodeTimer?.cancel();
    super.dispose();
  }
}
