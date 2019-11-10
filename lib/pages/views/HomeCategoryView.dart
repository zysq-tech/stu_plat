import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../data/apps.dart';
import './HomeCategorySubView.dart';

class HomeCategoryView extends StatefulWidget {
  @override
  _HomeCategoryViewState createState() => _HomeCategoryViewState();
}

class _HomeCategoryViewState extends State<HomeCategoryView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;
  PageController _pageController;
  int _tabIndex;
  List<String> _categoryList = [];

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _tabIndex = 0;
    _pageController = PageController(initialPage: _tabIndex);
    _categoryList = ['语言', '工具', '学习'];
  }

  void onTabTapped(int index) {
    setState(() {
      _tabIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: su.setHeight(27)),
      child: Row(
        children: <Widget>[
          Container(
              width: su.setWidth(274),
              child: ListView.builder(
                  itemCount: _categoryList.length,
                  itemBuilder: (_, index) => buildCategoryTab(index: index))),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: _categoryList.length,
              itemBuilder: (_, index) => HomeCategorySubView(
                label: _categoryList[index],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategoryTab({AppLabelData data, int index}) {
    final bool selected = index == _tabIndex;
    return Container(
      key: Key('category_index'),
      width: su.setWidth(274),
      height: su.setHeight(149),
      margin: EdgeInsets.symmetric(vertical: su.setHeight(4)),
      color: selected ? mainThemeColor : Colors.white,
      child: FlatButton(
        child: Center(
          child: Text(
            _categoryList[index],
            style: TextStyle(
              fontSize: su.setSp(40),
              letterSpacing: su.setWidth(8),
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
        onPressed: () => onTabTapped(index),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
