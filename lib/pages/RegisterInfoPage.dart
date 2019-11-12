import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../Application.dart';
import '../components/customCard.dart';
import '../data/page_data.dart';

class RegisterInfoPage extends StatefulWidget {
  RegisterInfoPage({@required this.data});

  final RegisterInfoPageData data;

  @override
  _RegisterInfoPageState createState() => _RegisterInfoPageState();
}

class _RegisterInfoPageState extends State<RegisterInfoPage> {
  ScreenUtil su;

  ProgressDialog pr;

  String necessaryInput = '(必填)';

  bool showAppealTip = false;

  bool allEditable = true;

  FocusNode pageFocusNode = FocusNode();

  TextEditingController idController = TextEditingController();
  FocusNode idFocus = FocusNode();
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController collegeController = TextEditingController();
  FocusNode collegeFocus = FocusNode();
  TextEditingController classController = TextEditingController();
  FocusNode classFocus = FocusNode();

  TextStyle _greyTextStyle;

  String selectedSchool;
  static List<String> schoolList;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    schoolList = [
      '学校1',
      '学校2',
      '学校3',
      '学校4',
      '学校5',
    ];
    _greyTextStyle = TextStyle(
        color: hexToColor('#959595'),
        fontSize: su.setSp(40),
        fontWeight: FontWeight.bold);
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

  void tryRegisterInfo() {
    setState(() {
      allEditable = false;
      showAppealTip = true;
    });
  }

  void emptyFocus() {
    FocusScope.of(context).requestFocus(pageFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '编辑${widget.data.type == 1 ? '学生' : '教师'}信息',
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
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: GestureDetector(
          onTap: emptyFocus,
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
                      buildInputContainer('学校',
                          mainChild: Text(
                            selectedSchool ?? '(必选)',
                            style: _greyTextStyle,
                          ),
                          onTap: allEditable ? showSchoolPicker : null),
                      buildInputContainer(
                          '${widget.data.type == 1 ? '学号' : '工号'}',
                          mainChild: buildTextField(idController, idFocus,
                              additionalInputFormatter: [
                                WhitelistingTextInputFormatter(letterNumberOnly)
                              ],
                              hintText: necessaryInput)),
                      buildInputContainer('姓名',
                          mainChild: buildTextField(nameController, nameFocus,
                              hintText: necessaryInput)),
                    ]..addAll(widget.data.type == 1
                        ? [
                            buildInputContainer('学院',
                                mainChild: buildTextField(
                                    collegeController, collegeFocus)),
                            buildInputContainer('班级',
                                mainChild: buildTextField(
                                    classController, classFocus)),
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
      ),
    );
  }

  Widget buildAppealTip() {
    return Row(
      children: <Widget>[
        Text('您的身份信息已被注册，请'),
        Material(
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: su.setWidth(30), vertical: su.setHeight(30)),
              child: Text(
                '申诉',
                style: TextStyle(color: mainThemeColor),
              ),
            ),
            onTap: () {
              var str = fluroCnParamsEncode(objectToJson(AppealPageData(
                  phone: '123456',
                  school: selectedSchool ?? schoolList[0],
                  code: 'code',
                  name: 'name',
                  collegeName: 'college',
                  className: 'class',
                  type: widget.data.type)));
              Application()
                  .router
                  .navigateTo(context, '${Routes.appealInfo}?data=$str');
            },
          ),
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
        onPressed: tryRegisterInfo,
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

  Widget buildTextField(TextEditingController controller, FocusNode focusNode,
      {String hintText,
      int lengthLimit = 30,
      List<TextInputFormatter> additionalInputFormatter = const [],
      bool enable = true}) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      style: _greyTextStyle,
      enabled: allEditable && enable,
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
      height: su.setHeight(119),
      border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      margin: EdgeInsets.symmetric(vertical: su.setHeight(18)),
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
              height: su.setHeight(51),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    collegeController.dispose();
    classController.dispose();
    idFocus.dispose();
    nameFocus.dispose();
    collegeFocus.dispose();
    classFocus.dispose();

    pageFocusNode.dispose();
    super.dispose();
  }
}
