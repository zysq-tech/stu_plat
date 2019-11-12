import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../components/customCard.dart';

enum EditPhoneEmailPageState {
  validateOld,
  validateKeyInfo,
  validateNew,
}

class EditPhoneEmailPage extends StatefulWidget {
  EditPhoneEmailPage({@required this.data});

  final EditPhoneEmailPageData data;

  @override
  _EditPhoneEmailPageState createState() => _EditPhoneEmailPageState();
}

class _EditPhoneEmailPageState extends State<EditPhoneEmailPage> {
  ScreenUtil su;

  EditPhoneEmailPageState _pageState;

  TextStyle _greyTextStyle;

  FocusNode _pageFocus = FocusNode();

  TextEditingController phoneEmailController = TextEditingController();
  FocusNode phoneEmailFocus = FocusNode();
  TextEditingController verifyCodeController = TextEditingController();
  FocusNode verifyCodeFocus = FocusNode();

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController codeController = TextEditingController();
  FocusNode codeFocus = FocusNode();

  int _getCodeCountDown;
  Timer _getCodeTimer;

  List<String> userTypeList = ['学生', '教师'];
  List<String> schoolList;

  String selectedUserType;
  String selectedSchool;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _pageState = widget.data.initialization
        ? EditPhoneEmailPageState.validateNew
        : EditPhoneEmailPageState.validateOld;
    _greyTextStyle = TextStyle(
        color: hexToColor('#626262'),
        fontSize: su.setSp(40),
        height: 1.2,
        fontWeight: FontWeight.bold);
    schoolList = ['学校1', '学校2', '学校3', '学校4', '学校5'];
  }

  void requestCode() {
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

  void showUserTypePicker() {
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: userTypeList),
        changeToFirst: true,
        onConfirm: (picker, list) {
          setState(() {
            selectedUserType = userTypeList[list[0]];
          });
        }).showModal(context);
  }

  void showSchoolPicker() {
    if (schoolList == null) return;
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: schoolList),
        changeToFirst: true,
        onConfirm: (picker, list) {
          setState(() {
            selectedSchool = schoolList[list[0]];
          });
        }).showModal(context);
  }

  void clearCountDown() {
    _getCodeTimer?.cancel();
    _getCodeCountDown = 0;
  }

  void clearInput() {
    phoneEmailController.clear();
    verifyCodeController.clear();
  }

  void tryResetPhoneEmail() {
    pr.show();
    Future.delayed(const Duration(milliseconds: 1500))
        .then((_) => pr.hide())
        .then((b) {
      Navigator.pop(context, true);
    });
  }

  void emptyFocus() {
    FocusScope.of(context).requestFocus(_pageFocus);
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    return Scaffold(
      backgroundColor: homeBgColor,
      appBar: AppBar(
        title: Text(
          '编辑${widget.data.type == 1 ? '手机号' : '邮箱'}',
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
            Navigator.pop(context, false);
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
              children: _pageState == EditPhoneEmailPageState.validateKeyInfo
                  ? buildKeyInfoValidator()
                  : buildPhoneEmailValidator(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildPhoneEmailValidator() {
    final setPhone = widget.data.type == 1;
    final firstSet = widget.data.initialization;
    final setNew = _pageState == EditPhoneEmailPageState.validateNew;
    return <Widget>[
      buildInputContainer(
          header:
              '${setNew ? firstSet ? '' : '新' : '旧'}${setPhone ? '手机号' : '邮箱'}:',
          mainChild: buildTextField(phoneEmailController, phoneEmailFocus,
              hintText: '请输入',
              lengthLimit: setPhone ? 11 : 30,
              additionalInputFormatter: setPhone
                  ? [WhitelistingTextInputFormatter.digitsOnly]
                  : const []),
          tail: Container()),
      buildInputContainer(
          mainChild: buildTextField(verifyCodeController, verifyCodeFocus,
              hintText: '请输入验证码',
              lengthLimit: 6,
              additionalInputFormatter: [
                WhitelistingTextInputFormatter.digitsOnly
              ]),
          tail: GestureDetector(
            onTap: requestCode,
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
      buildMainBtn(),
      setNew
          ? Container()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '麻烦了，手机号无法使用?',
                  style: TextStyle(
                      color: hexToColor('#434343'),
                      fontSize: su.setSp(40),
                      fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _pageState = EditPhoneEmailPageState.validateKeyInfo;
                    });
                  },
                  child: Text(
                    '其他验证方式',
                    style: TextStyle(
                        color: mainThemeColor,
                        fontSize: su.setSp(45),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
    ];
  }

  Widget buildMainBtn() {
    return CustomCard.cricleEnds(
      width: su.setWidth(944),
      height: su.setHeight(119),
      color: mainThemeColor,
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.only(top: su.setHeight(161), bottom: su.setHeight(76)),
      child: FlatButton(
        onPressed: () {
          emptyFocus();
          if (_pageState == EditPhoneEmailPageState.validateOld) {
            setState(() {
              _pageState = EditPhoneEmailPageState.validateNew;
              clearCountDown();
              clearInput();
            });
          } else if (_pageState == EditPhoneEmailPageState.validateNew) {
            tryResetPhoneEmail();
          } else {
            setState(() {
              _pageState = EditPhoneEmailPageState.validateNew;
              clearCountDown();
              clearInput();
            });
          }
        },
        child: Center(
          child: Text(
            '提交',
            style: TextStyle(
                color: Colors.white,
                fontSize: su.setSp(50),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  List<Widget> buildKeyInfoValidator() {
    return <Widget>[
      Container(
        width: su.setWidth(965),
        child: Text(
          '请认真填写下面资料，为了防止他人冒充，只有当您提供的资料足够完整且真实时，才能通过身份验证。全部资料仅用于身份验证并受到保护',
          style: TextStyle(
              color: hexToColor('#626262'),
              fontSize: su.setSp(43),
              letterSpacing: su.setWidth(4.3),
              fontWeight: FontWeight.bold),
        ),
      ),
      CustomCard(
        width: su.setWidth(1006),
        height: su.setHeight(701),
        margin: EdgeInsets.symmetric(vertical: su.setHeight(50)),
        borderRadius: BorderRadius.circular(su.setHeight(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildInputContainer(
                header: '您的姓名:',
                mainChild:
                    buildTextField(nameController, nameFocus, lengthLimit: 10)),
            buildInputContainer(
                header: '学校:',
                mainChild: Text(
                  selectedSchool ?? '',
                  style: _greyTextStyle,
                ),
                onTap: showSchoolPicker),
            buildInputContainer(
                header: '身份:',
                mainChild: Text(
                  selectedUserType ?? '',
                  style: _greyTextStyle,
                ),
                onTap: showUserTypePicker),
            buildInputContainer(
                header: '证件号码:',
                mainChild: buildTextField(codeController, codeFocus)),
          ],
        ),
      ),
      buildMainBtn()
    ];
  }

  Widget buildTextField(TextEditingController controller, FocusNode focusNode,
      {String hintText,
      int lengthLimit = 30,
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
      textAlignVertical: TextAlignVertical.center,
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
      margin: EdgeInsets.symmetric(vertical: su.setHeight(18)),
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
    phoneEmailController.dispose();
    phoneEmailFocus.dispose();
    verifyCodeController.dispose();
    verifyCodeFocus.dispose();
    nameController.dispose();
    nameFocus.dispose();
    codeController.dispose();
    codeFocus.dispose();
    _pageFocus.dispose();

    _getCodeTimer?.cancel();

    super.dispose();
  }
}
