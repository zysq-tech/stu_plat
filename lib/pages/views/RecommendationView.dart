import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/customCard.dart';
import '../../Application.dart';
import './RecommendationBestView.dart';
import './RecommendationRankView.dart';

class RecommentdationView extends StatefulWidget {
  @override
  _RecommentdationViewState createState() => _RecommentdationViewState();
}

class _RecommentdationViewState extends State<RecommentdationView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  void onTabTapped(int index) {
    if (index == _tabController.index) return;
    _tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: su.setWidth(1080),
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
              tabs: <Widget>[Tab(text: '精选'), Tab(text: '排行')],
              onTap: onTabTapped,
            ),
            decoration: BoxDecoration(
                boxShadow: CustomCard.defaultBoxShadow, color: Colors.white),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                RecommendationBestView(),
                RecommendationRankView()
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
