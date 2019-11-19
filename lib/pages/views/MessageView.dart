import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../components/customCard.dart';
import '../../data/index.dart';
import '../../data/page_data.dart';

class MessageView extends StatefulWidget {
  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;
  TabController _tabController;
  int _tabIndex;
  ScrollController _scrollController;

  Color _color1 = hexToColor('#262626');
  Color _color2 = hexToColor('#313131');

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabIndex = 0;
    _tabController =
        TabController(length: 2, initialIndex: _tabIndex, vsync: this);
    _scrollController = ScrollController();
  }

  void onTabTapped(int value) {
    if (_tabIndex == value) return;
    setState(() {
      _tabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: su.setWidth(1080),
      color: homeBgColor,
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: hexToColor('#15b8c9'),
              labelStyle: TextStyle(
                  fontSize: su.setSp(40), fontWeight: FontWeight.bold),
              unselectedLabelColor: hexToColor('#949494'),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[Tab(text: '我的评价'), Tab(text: '消息')],
              onTap: onTabTapped,
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: hexToColor('#dcdcdc'), width: 2)),
                color: Colors.white),
          ),
          Expanded(
            child: IndexedStack(
              index: _tabIndex,
              children: <Widget>[
                ListView.builder(
                  controller: _scrollController,
                  itemCount: 10,
                  itemBuilder: (_, index) => buildCommentCard(data: null),
                ),
                ListView.builder(
                  controller: _scrollController,
                  itemCount: 10,
                  itemBuilder: (_, index) => buildMessageCard(data: null),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMessageCard({InAppNewsWrapperData data}) {
    return Center(
        child: GestureDetector(
      onTap: () {
        var str = fluroCnParamsEncode(
            objectToJson(MessageDetailPageData(data: data?.appNews)));
        Application()
            .router
            .navigateTo(context, '${Routes.messageDetail}?data=$str');
      },
      child: CustomCard(
        width: su.setWidth(1013),
        height: su.setWidth(232),
        borderRadius: BorderRadius.circular(su.setWidth(20)),
        margin: EdgeInsets.symmetric(vertical: su.setWidth(12)),
        padding: EdgeInsets.symmetric(horizontal: su.setWidth(33)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: su.setWidth(43)),
              child: Image.asset(
                'assets/icon/icon_service.png',
                width: su.setWidth(142),
                height: su.setWidth(142),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: '大学生应用试用平台',
                    style: TextStyle(
                        color: _color2,
                        fontSize: su.setSp(40),
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                            color: _color2,
                            fontSize: su.setSp(35),
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '客服',
                        style: TextStyle(
                            color: _color2,
                            fontSize: su.setSp(30),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Message Content ' * 5,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: _color2,
                      fontSize: su.setSp(35),
                      fontWeight: FontWeight.bold),
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }

  Widget buildCommentCard({AppCommentData data}) {
    return Center(
      child: GestureDetector(
        onTap: () {
          var str = fluroCnParamsEncode(objectToJson(AppDetailPageData()));
          Application()
              .router
              .navigateTo(context, '${Routes.appDetail}?data=$str');
        },
        child: CustomCard(
          width: su.setWidth(1013),
          height: su.setWidth(397),
          borderRadius: BorderRadius.circular(su.setWidth(20)),
          margin: EdgeInsets.symmetric(vertical: su.setWidth(18)),
          padding: EdgeInsets.symmetric(vertical: su.setWidth(26)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    right: su.setWidth(39), left: su.setWidth(31)),
                child: CustomCard(
                  width: su.setWidth(144),
                  height: su.setWidth(144),
                  borderRadius: BorderRadius.circular(su.setWidth(20)),
                  // color: Colors.grey,
                  boxShadow: CustomCard.noneBoxShadow,
                  image: getDefaultIcon(),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: su.setWidth(35)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: buildAppNameAndCount(),
                        ),
                        buildCommentTime()
                      ],
                    ),
                    buildComment(),
                    buildRatingRow()
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingRow() {
    return Row(
      children: <Widget>[
        RatingBar(
          itemBuilder: (_, index) => Icon(
            Icons.star,
            color: mainThemeColor,
          ),
          itemCount: 5,
          initialRating: 1,
          itemSize: su.setWidth(35),
          onRatingUpdate: (d) {},
          ignoreGestures: true,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: su.setWidth(52)),
            child: Text(
              '(1.0.1)',
              style: TextStyle(color: _color1, fontSize: su.setSp(26)),
            ),
          ),
        ),
        Material(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: su.setWidth(20)),
              child: Text(
                '删除',
                style: TextStyle(color: mainThemeColor, fontSize: su.setSp(30)),
              ),
            ),
            onTap: () {
              print('delete');
            },
          ),
        )
      ],
    );
  }

  Widget buildComment() {
    return Text(
      'App Comment ' * 10,
      style: TextStyle(color: _color1, fontSize: su.setSp(30), height: 1.33),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildCommentTime() {
    return Padding(
      padding: EdgeInsets.only(top: su.setWidth(50)),
      child: Text(
        '2019/11/11 11:11',
        style: TextStyle(color: mainThemeColor, fontSize: su.setSp(25)),
      ),
    );
  }

  Widget buildAppNameAndCount() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: su.setWidth(38)),
          child: Text(
            'App Name',
            softWrap: false,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: _color1,
                fontSize: su.setSp(40),
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: su.setWidth(21)),
          child: Text(
            '评论(1234)条',
            style:
                TextStyle(color: hexToColor('#707070'), fontSize: su.setSp(26)),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
