import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../data/apps.dart';
import '../../components/customCard.dart';
import '../../components/appListItem.dart';

class HomeCategorySubView extends StatefulWidget {
  HomeCategorySubView({this.data, this.label});

  final AppLabelData data;
  final String label;

  @override
  _HomeCategorySubViewState createState() => _HomeCategorySubViewState();
}

class _HomeCategorySubViewState extends State<HomeCategorySubView>
    with SingleTickerProviderStateMixin {
  ScreenUtil su;
  TabController _tabController;
  int _tabIndex;
  ScrollController _scrollController;

  List<String> _tabs;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabIndex = 0;
    _tabs = List<String>.generate(5, (index) => '子${widget.label}${index + 1}');
    _tabController = TabController(
        initialIndex: _tabIndex, length: _tabs.length, vsync: this);
    _scrollController = ScrollController();
  }

  void onTabTapped(int index) {
    if (index == _tabIndex) return;
    setState(() {
      _tabIndex = index;
      _scrollController.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomCard(
          width: su.setWidth(670),
          height: su.setWidth(188),
          image: null,
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(su.setWidth(40)),
          child: Text(
            widget.label,
            style: TextStyle(color: Colors.white, fontSize: su.setSp(60)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: su.setWidth(32)),
          child: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: su.setWidth(9)),
            controller: _tabController,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _tabs.map((s) => buildSubCategoryTab(s)).toList(),
            onTap: onTabTapped,
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: (_tabController.index + 1) * 2,
            itemBuilder: (_, index) => buildAppItem(),
          ),
        )
      ],
    );
  }

  Tab buildSubCategoryTab(String s, {AppLabelData data}) {
    return Tab(
      child: CustomCard.cricleEnds(
        width: su.setWidth(202),
        height: su.setWidth(74),
        boxShadow: CustomCard.noneBoxShadow,
        color: mainThemeColor,
        child: Text(
          s,
          style: TextStyle(fontSize: su.setSp(35), color: Colors.white),
        ),
      ),
    );
  }

  Center buildAppItem({AppInfoData data}) {
    return Center(
      child: CustomCard(
        width: su.setWidth(740),
        height: su.setWidth(166),
        borderRadius: BorderRadius.circular(su.setWidth(20)),
        margin: EdgeInsets.symmetric(vertical: su.setWidth(14)),
        padding: EdgeInsets.only(left: su.setWidth(10)),
        child: AppListItem(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
