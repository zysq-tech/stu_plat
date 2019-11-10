import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/customCard.dart';
import '../../Application.dart';
import '../../components/appListItem.dart';

class RecommendationRankView extends StatefulWidget {
  @override
  _RecommendationRankViewState createState() => _RecommendationRankViewState();
}

class _RecommendationRankViewState extends State<RecommendationRankView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  TabController _tabController;
  ScrollController _scrollController;
  ScreenUtil su;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    _scrollController = ScrollController();
  }

  void onTabTapped(int index) {
    if (_tabController.index == index) return;
    setState(() {
      _tabController.index = index;
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        Container(
          width: su.setWidth(1080),
          height: su.setHeight(150),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            tabs: [
              buildRankTab('下载榜', 0),
              buildRankTab('热搜榜', 1),
              buildRankTab('新秀榜', 2)
            ],
            onTap: onTabTapped,
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 100,
            itemBuilder: (_, index) => buildRankedAppListItem(index + 1),
          ),
        )
      ],
    );
  }

  Widget buildRankedAppListItem(int leading) {
    return Center(
        child: CustomCard(
      width: su.setWidth(1014),
      height: su.setHeight(194),
      borderRadius: BorderRadius.circular(su.setHeight(20)),
      margin: EdgeInsets.symmetric(vertical: su.setHeight(12)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '$leading',
              textAlign: TextAlign.right,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: TextStyle(
                  color: hexToColor('#ababab'),
                  fontSize: su.setSp(50),
                  fontWeight: FontWeight.bold),
            ),
          ),
          AppListItem(
            width: 910,
            margin: EdgeInsets.symmetric(horizontal: su.setWidth(20)),
          ),
        ],
      ),
    ));
  }

  Widget buildRankTab(String text, int index) {
    final selected = index == _tabController.index;
    return Tab(
      child: CustomCard.cricleEnds(
          width: su.setWidth(selected ? 250 : 219),
          height: su.setHeight(selected ? 100 : 65),
          color: mainThemeColor,
          boxShadow:
              selected ? CustomCard.noneBoxShadow : CustomCard.defaultBoxShadow,
          child: Text(
            text,
            style: selected
                ? TextStyle(
                    color: hexToColor('#efefed'),
                    fontSize: su.setSp(40),
                    letterSpacing: su.setWidth(8))
                : TextStyle(
                    color: Colors.white,
                    fontSize: su.setSp(30),
                    letterSpacing: su.setWidth(6)),
          )),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }
}
