import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../data/other.dart';
import '../components/customCard.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({@required this.data});

  final FeedbackPageData data;

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  ScreenUtil su;

  TextEditingController contentController = TextEditingController();
  FocusNode contentFocus = FocusNode();

  FocusNode selectorFocus = FocusNode();
  FocusNode _pageFocus = FocusNode();

  // List<QuestionTypeData> questionList;
  List<String> questionList;
  int _selectIndex;

  TextStyle _contentStyle;

  OverlayEntry _selectorEntry;

  LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _contentStyle = TextStyle(
        color: hexToColor('#c9c9c9'),
        fontSize: su.setSp(40),
        fontWeight: FontWeight.bold);
    questionList = ['账号密码', '下载', '用户身份', '客户端', '其他'];
    selectorFocus.addListener(() {
      if (selectorFocus.hasFocus) {
        _selectorEntry = createSelectPopupWindow();
        Overlay.of(context).insert(_selectorEntry);
      } else {
        _selectorEntry.remove();
      }
    });
  }

  OverlayEntry createSelectPopupWindow() {
    return OverlayEntry(
      builder: (_) => Positioned(
        width: su.setWidth(944),
        child: CompositedTransformFollower(
          link: _layerLink,
          child: CustomCard(
            width: su.setWidth(944),
            // constraints: BoxConstraints(maxHeight: su.setWidth(800)),
            borderRadius: BorderRadius.circular(su.setWidth(59.5)),
            border:
                Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
            boxShadow: CustomCard.noneBoxShadow,
            child: Column(
              children: questionList.map((str) {
                int index = questionList.indexOf(str);
                return FlatButton(
                  onPressed: () {
                    setState(() {
                      _selectIndex = index;
                      emptyFocus();
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        questionList[index],
                        style: TextStyle(
                            color: hexToColor('#313131'),
                            fontSize: su.setSp(45)),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void onSelectType() {
    emptyFocus();
    if (questionList == null) return;
    FocusScope.of(context).requestFocus(selectorFocus);
  }

  void submitFeedback() {
    emptyFocus();
  }

  void emptyFocus() {
    FocusScope.of(context).requestFocus(_pageFocus);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: homeBgColor,
        appBar: AppBar(
          title: Text(
            '意见反馈',
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
              emptyFocus();
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
                  buildTips('问题类型(必选)'),
                  buildTypeSelector(),
                  buildTips('详情描述(必填)'),
                  buildContentInput(),
                  buildSubmitBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomCard buildSubmitBtn() {
    return CustomCard.cricleEnds(
        width: su.setWidth(944),
        height: su.setWidth(119),
        color: mainThemeColor,
        boxShadow: CustomCard.noneBoxShadow,
        margin: EdgeInsets.only(top: su.setWidth(194)),
        child: FlatButton(
          onPressed: submitFeedback,
          child: Center(
            child: Text(
              '提交',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: su.setSp(50),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  Widget buildContentInput() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(contentFocus);
      },
      child: CustomCard(
        width: su.setWidth(943),
        height: su.setWidth(674),
        color: hexToColor('#f8f8f8'),
        boxShadow: CustomCard.noneBoxShadow,
        borderRadius: BorderRadius.circular(su.setWidth(40)),
        padding: EdgeInsets.symmetric(horizontal: su.setWidth(42)),
        border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
        alignment: Alignment.topLeft,
        child: TextField(
          controller: contentController,
          focusNode: contentFocus,
          style: _contentStyle,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          inputFormatters: [LengthLimitingTextInputFormatter(100)],
          decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: _contentStyle,
              hintText: '至少填写7个字'),
        ),
      ),
    );
  }

  Widget buildTypeSelector() {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CustomCard.cricleEnds(
        width: su.setWidth(944),
        height: su.setWidth(119),
        border: Border.all(color: hexToColor('#a0a0a0'), width: su.setWidth(3)),
        boxShadow: CustomCard.noneBoxShadow,
        child: FlatButton(
          onPressed: onSelectType,
          focusNode: selectorFocus,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _selectIndex == null ? '(选择)' : questionList[_selectIndex],
                style: TextStyle(
                    color: hexToColor('#313131'), fontSize: su.setSp(45)),
              ),
              Image.asset(
                'assets/icon/icon_dropdown.png',
                width: su.setWidth(52),
                height: su.setWidth(28),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildTips(String text) {
    return Container(
      width: su.setWidth(1080),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(67)),
      margin: EdgeInsets.symmetric(vertical: su.setWidth(42)),
      child: Text(
        text,
        style: TextStyle(
            color: hexToColor('#434343'),
            fontSize: su.setSp(43),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void dispose() {
    contentController.dispose();
    contentFocus.dispose();
    selectorFocus.dispose();
    _pageFocus.dispose();

    super.dispose();
  }
}
