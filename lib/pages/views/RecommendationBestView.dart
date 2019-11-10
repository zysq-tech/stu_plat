import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../components/imageAppCard.dart';
import '../../components/customCard.dart';
import '../../components/appListItem.dart';

class RecommendationBestView extends StatefulWidget {
  @override
  _RecommendationBestViewState createState() => _RecommendationBestViewState();
}

class _RecommendationBestViewState extends State<RecommendationBestView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: su.setHeight(25)),
      itemBuilder: (_, index) => index == 1
          ? buildRecommendListCard()
          : ImageAppCard(
              bestTag: index == 0,
            ),
    );
  }

  Widget buildRecommendListCard() {
    return Center(
      child: CustomCard(
        width: su.setWidth(985),
        height: su.setHeight(715),
        borderRadius: BorderRadius.circular(su.setHeight(40)),
        margin: EdgeInsets.symmetric(vertical: su.setHeight(20)),
        padding: EdgeInsets.symmetric(
            vertical: su.setHeight(45), horizontal: su.setWidth(50)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '精品必备',
              style: TextStyle(
                  fontSize: su.setSp(50),
                  letterSpacing: su.setWidth(10),
                  fontWeight: FontWeight.bold),
            ),
          ]..addAll([1, 2, 3].map((v) => AppListItem(
                showTag: false,
              ))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
