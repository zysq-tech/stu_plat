import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/page_data.dart';
import '../Application.dart';
import '../components/customCard.dart';

import './views/home_page_views.dart';
import './views/SearchView.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.data});

  final HomePageData data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _pageIndex;

  ScreenUtil su;

  List<Widget> _views;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;

    _pageIndex = 0;
    _pageController = PageController(initialPage: _pageIndex, keepPage: true);

    _views = [
      RecommentdationView(),
      MessageView(),
      HomeView(),
      ManagementView(),
      UserView()
    ];
  }

  void onTapNavIndex(int index) {
    if (index == _pageIndex) return;
    setState(() {
      _pageIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _pageIndex == 4
          ? null
          : AppBar(
              leading: null,
              centerTitle: true,
              title: buildSearchBar(context),
              backgroundColor: mainThemeColor,
            ),
      bottomNavigationBar: buildNavBar(),
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {},
        itemCount: 5,
        itemBuilder: (context, index) => _views[index],
      ),
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return CustomCard.cricleEnds(
      width: su.setWidth(826),
      height: su.setWidth(101),
      border: Border.all(color: Colors.white, width: su.setWidth(3)),
      boxShadow: CustomCard.noneBoxShadow,
      padding: EdgeInsets.symmetric(horizontal: su.setWidth(35)),
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchView());
          },
          child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: su.setWidth(50)),
                  child: Image.asset(
                    'assets/icon/icon_search.png',
                    width: su.setWidth(42),
                    height: su.setWidth(42),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Search',
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: su.setSp(40),
                        fontWeight: FontWeight.bold,
                        letterSpacing: su.setWidth(4)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildNavBar() {
    return BottomNavigationBar(
      elevation: 1,
      currentIndex: _pageIndex,
      type: BottomNavigationBarType.fixed,
      iconSize: su.setWidth(55),
      selectedItemColor: mainThemeColor,
      unselectedItemColor: hexToColor('#8a8a8a'),
      selectedFontSize: su.setSp(28),
      unselectedFontSize: su.setSp(28),
      items: [
        buildNavItem('assets/icon/icon_recommendation.png', '精选'),
        buildNavItem('assets/icon/icon_message.png', '消息'),
        buildNavItem('assets/icon/icon_home.png', '主页'),
        buildNavItem('assets/icon/icon_management.png', '管理'),
        buildNavItem('assets/icon/icon_self.png', '我的'),
      ],
      onTap: onTapNavIndex,
    );
  }

  BottomNavigationBarItem buildNavItem(String iconAssetPath, String title) {
    return BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(iconAssetPath),
        ),
        title: Text(title));
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
}
