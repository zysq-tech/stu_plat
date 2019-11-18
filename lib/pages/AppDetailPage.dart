import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../data/page_data.dart';
import '../data/apps.dart';
import '../components/customCard.dart';
import './views/AppDetailView.dart';
import './views/AppCommentsView.dart';

enum AppDetailPageState { initial, share, comment }

class AppDetailPage extends StatefulWidget {
  AppDetailPage({@required this.data});

  final AppDetailPageData data;

  @override
  _AppDetailPageState createState() => _AppDetailPageState();
}

class _AppDetailPageState extends State<AppDetailPage>
    with SingleTickerProviderStateMixin {
  ScreenUtil su;

  AppDetailPageState _pageState;

  TabController _tabController;
  int _tabIndex;
  PageController _pageController;

  TextEditingController commentController = TextEditingController();
  FocusNode commentFocus = FocusNode();

  FocusNode _pageFocus = FocusNode();

  BorderSide _borderSidedc2;

  Color _color43 = hexToColor('#434343');
  Color _color26 = hexToColor('#262626');
  Color _color7d = hexToColor('#7d7d7d');

  double commentRating;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _pageState = AppDetailPageState.initial;
    _tabIndex = 0;
    _tabController =
        TabController(length: 2, initialIndex: _tabIndex, vsync: this);
    _pageController = PageController(initialPage: _tabIndex);
    _borderSidedc2 =
        BorderSide(color: hexToColor('#dcdcdc'), width: su.setWidth(2));
  }

  void onTapMoreAction() {
    String str = fluroCnParamsEncode(objectToJson(FeedbackPageData()));
    Application().router.navigateTo(context, '${Routes.feedback}?data=$str');
    // showGeneralDialog(
    //     context: context,
    //     pageBuilder: (context, a1, a2) => WillPopScope(
    //           onWillPop: () async => false,
    //           child: Center(
    //             child: Material(
    //               color: Colors.transparent,
    //               child: CustomCard(
    //                   width: su.setWidth(992),
    //                   height: su.setWidth(1216),
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(su.setWidth(40)),
    //                   child: Column(
    //                     children: <Widget>[
    //                       FlatButton(
    //                           onPressed: () {
    //                             Navigator.pop(context);
    //                           },
    //                           child: Text('hahaha'))
    //                     ],
    //                   )),
    //             ),
    //           ),
    //         ),
    //     barrierColor: Colors.black.withOpacity(0.6),
    //     barrierDismissible: false,
    //     barrierLabel: 'barrier',
    //     transitionDuration: Duration(milliseconds: 200));
  }

  void submitComment() {
    emptyFocus();
  }

  void onShareWith(int index) {}

  void emptyFocus() {
    FocusScope.of(context).requestFocus(_pageFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          widget.data.appData?.appName ?? 'App Name',
          softWrap: false,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontSize: su.setSp(50),
              color: hexToColor('#313131'),
              fontWeight: FontWeight.bold),
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
        actions: <Widget>[
          MaterialButton(
              child: Image.asset(
                'assets/icon/icon_more.png',
                width: su.setWidth(14),
                height: su.setWidth(64),
              ),
              onPressed: onTapMoreAction)
        ],
      ),
      body: SizedBox.expand(
        child: GestureDetector(
          onTap: emptyFocus,
          child: Column(
            children: <Widget>[
              buildTopInfoDisplay(),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: <Widget>[
                    AppDetailView(
                      data: widget.data.appData,
                    ),
                    AppCommentsView(
                      data: widget.data.appData,
                    )
                  ],
                ),
              ),
              buildFooter()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopInfoDisplay() {
    return Container(
      width: su.setWidth(1080),
      height: su.setWidth(347),
      decoration: BoxDecoration(
          color: Colors.white, border: Border(bottom: _borderSidedc2)),
      padding: EdgeInsets.only(top: su.setWidth(35)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[buildTopAppInfo(), buildTabBar()],
      ),
    );
  }

  Container buildTopAppInfo() {
    final AppInfoData data = widget.data.appData;
    return Container(
      height: su.setWidth(144),
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(50)),
      child: Row(
        children: <Widget>[
          CustomCard(
            width: su.setWidth(144),
            height: su.setWidth(144),
            borderRadius: BorderRadius.circular(su.setWidth(20)),
            boxShadow: CustomCard.noneBoxShadow,
            margin: EdgeInsets.only(right: su.setWidth(35)),
            // color: Colors.grey,
            image: getDefaultIcon(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        data?.appName ?? 'App Name',
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: _color26,
                            fontSize: su.setSp(40),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                          text: '0.0',
                          style: TextStyle(
                            color: _color43,
                            fontSize: su.setSp(60),
                          ),
                          children: [
                            TextSpan(
                                text: '分',
                                style: TextStyle(
                                    color: _color43, fontSize: su.setSp(40)))
                          ]),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        formatBytesSize(data?.appSize ?? 0),
                        style:
                            TextStyle(color: _color26, fontSize: su.setSp(30)),
                      ),
                    ),
                    RatingBar(
                      itemBuilder: (_, index) => Icon(
                        Icons.star,
                        color: mainThemeColor,
                      ),
                      ignoreGestures: true,
                      itemCount: 5,
                      initialRating: 0,
                      itemSize: su.setWidth(48),
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: su.setWidth(14)),
                      onRatingUpdate: (d) {},
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TabBar buildTabBar() {
    final bool onIntroView = _tabIndex == 0;
    return TabBar(
      controller: _tabController,
      onTap: onTapTabBar,
      indicatorColor: Colors.transparent,
      tabs: <Widget>[
        Tab(
          child: CustomCard.cricleEnds(
            width: su.setWidth(208),
            height: su.setWidth(84),
            boxShadow: CustomCard.noneBoxShadow,
            color: onIntroView ? mainThemeColor : Colors.white,
            child: Text('详情',
                style: TextStyle(
                    color: onIntroView ? Colors.white : _color43,
                    fontSize: su.setSp(40))),
            border: onIntroView
                ? null
                : Border.all(color: _color7d, width: su.setWidth(3)),
          ),
        ),
        Tab(
          child: CustomCard.cricleEnds(
            width: su.setWidth(208),
            height: su.setWidth(84),
            boxShadow: CustomCard.noneBoxShadow,
            color: !onIntroView ? mainThemeColor : Colors.white,
            child: Text('评论',
                style: TextStyle(
                    color: !onIntroView ? Colors.white : _color43,
                    fontSize: su.setSp(40))),
            border: !onIntroView
                ? null
                : Border.all(color: _color7d, width: su.setWidth(3)),
          ),
        ),
      ],
    );
  }

  void onTapTabBar(int index) {
    if (_tabIndex != index) {
      setState(() {
        _tabIndex = index;
        _pageController.animateToPage(_tabIndex,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
      });
    }
  }

  Widget buildFooter() {
    switch (_pageState) {
      case AppDetailPageState.share:
        return buildShareFooter();
      case AppDetailPageState.comment:
        return buildCommentFooter();
      case AppDetailPageState.initial:
      default:
        return buildMainFooter();
    }
  }

  Widget buildMainFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: su.setWidth(20)),
      decoration: BoxDecoration(
          color: Colors.white, border: Border(top: _borderSidedc2)),
      child: Row(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
                child: Image.asset(
                  'assets/icon/icon_share.png',
                  width: su.setWidth(68),
                  height: su.setWidth(75),
                ),
                onTap: () {
                  setState(() {
                    _pageState = AppDetailPageState.share;
                  });
                }),
          ),
          CustomCard.cricleEnds(
            width: su.setWidth(636),
            height: su.setWidth(114),
            color: mainThemeColor,
            boxShadow: CustomCard.noneBoxShadow,
            child: MaterialButton(
              child: Center(
                child: Text(
                  '安装',
                  style: TextStyle(color: Colors.white, fontSize: su.setSp(50)),
                ),
              ),
              onPressed: () {},
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
                child: Image.asset(
                  'assets/icon/icon_message.png',
                  width: su.setWidth(74),
                  height: su.setWidth(74),
                ),
                onTap: () {
                  setState(() {
                    _pageState = AppDetailPageState.comment;
                  });
                }),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }

  Widget buildCommentFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: su.setWidth(28)),
      decoration: BoxDecoration(
          color: Colors.white, border: Border(top: _borderSidedc2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RatingBar(
                itemBuilder: (_, index) => Icon(
                  Icons.star,
                  color: mainThemeColor,
                ),
                itemCount: 5,
                initialRating: commentRating ?? 0,
                itemSize: su.setWidth(60),
                itemPadding: EdgeInsets.symmetric(horizontal: su.setWidth(18)),
                onRatingUpdate: (d) {
                  setState(() {
                    commentRating = d;
                  });
                },
              ),
              Text(
                '(${commentRating ?? '选定评分'})',
                style: TextStyle(
                    color: hexToColor('#535353'),
                    fontSize: su.setSp(35),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            height: su.setWidth(36),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomCard.cricleEnds(
                width: su.setWidth(860),
                height: su.setWidth(116),
                boxShadow: CustomCard.noneBoxShadow,
                border: Border.all(color: _color7d, width: su.setWidth(1)),
                padding: EdgeInsets.symmetric(horizontal: su.setWidth(60)),
                child: TextField(
                  controller: commentController,
                  focusNode: commentFocus,
                  style: TextStyle(
                      color: hexToColor('#a0a0a0'),
                      fontSize: su.setSp(45),
                      fontWeight: FontWeight.bold),
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: '没事儿整两句......'),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  child: Image.asset(
                    'assets/icon/icon_submit.png',
                    width: su.setWidth(85),
                    height: su.setWidth(75),
                  ),
                  onTap: submitComment,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildShareFooter() {
    return Container(
      height: su.setWidth(267),
      // padding: EdgeInsets.symmetric(vertical: su.setWidth(28)),
      decoration: BoxDecoration(
          color: Colors.white, border: Border(top: _borderSidedc2)),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildShareOption(
              index: 0,
              icon: Image.asset(
                'assets/icon/icon_wechatZone.png',
                width: su.setWidth(135),
                height: su.setSp(135),
              ),
              text: '朋友圈'),
          buildShareOption(
              index: 1,
              icon: Image.asset(
                'assets/icon/icon_wechat.png',
                width: su.setWidth(144),
                height: su.setSp(116),
              ),
              text: '微信'),
          buildShareOption(
              index: 2,
              icon: Image.asset(
                'assets/icon/icon_qq.png',
                width: su.setWidth(119),
                height: su.setSp(139),
              ),
              text: 'QQ'),
          buildShareOption(
              index: 3,
              icon: Image.asset(
                'assets/icon/icon_link.png',
                width: su.setWidth(141),
                height: su.setSp(140),
              ),
              text: '复制链接'),
        ],
      ),
    );
  }

  Material buildShareOption({int index, Widget icon, String text}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onShareWith(index),
        child: Container(
          width: su.setWidth(150),
          height: su.setWidth(200),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              icon,
              Text(
                text,
                style: TextStyle(
                    color: _color43,
                    fontSize: su.setSp(35),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
}
