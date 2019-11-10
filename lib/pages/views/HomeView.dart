import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import './HomeChosenView.dart';
import './HomeCategoryView.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  void onTabTapped(int index) {}

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
              tabs: <Widget>[Tab(text: '精挑细选'), Tab(text: '分类')],
              onTap: onTabTapped,
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: hexToColor('#dcdcdc'), width: 2)),
                color: Colors.white),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                HomeChosenView(),
                HomeCategoryView(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
