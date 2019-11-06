import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../Utils.dart';
import '../components/customCard.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController _tabController;
  int _tabIndex = 0;

  ScreenUtil su;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabIndex = 0;
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: _tabIndex);
  }

  void onTapTab(int index) {
    if (index != _tabIndex)
      setState(() {
        _tabIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: su.setHeight(316),
                height: su.setHeight(316),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(su.setHeight(40)),
                    color: hexToColor('#626262')),
              ),
              CustomCard(
                width: su.setWidth(961),
                height: su.setHeight(1384),
                borderRadius: BorderRadius.circular(su.setHeight(40)),
                child: Column(
                  children: <Widget>[
                    buildTabBar(),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[buildTabView(), buildTabView()],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabView() {
    return Padding(
      padding: EdgeInsets.only(top: su.setHeight(40)),
      child: Column(
        children: <Widget>[
          buildInputCard(),
        ],
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
              color: _tabIndex == 0 ? hexToColor('#13b9c7') : Colors.white,
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
              color: _tabIndex == 1 ? hexToColor('#13b9c7') : Colors.white,
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
      child: child,
    );
  }
}
