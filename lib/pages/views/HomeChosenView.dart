import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../components/customCard.dart';
import '../../components/appLogoItem.dart';
import '../../components/appListItem.dart';
import '../../Application.dart';

class HomeChosenView extends StatefulWidget {
  @override
  _HomeChosenViewState createState() => _HomeChosenViewState();
}

class _HomeChosenViewState extends State<HomeChosenView>
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
        padding: EdgeInsets.symmetric(vertical: su.setHeight(12)),
        itemCount: 10,
        itemBuilder: (_, index) {
          if (index == 0)
            return buildDisplaySwiper();
          else if (index == 1)
            return buildLatestCard();
          else
            return buildTaggedAppCard();
        });
  }

  Widget buildTaggedAppCard() {
    return Center(
      child: CustomCard(
        width: su.setWidth(995),
        height: su.setHeight(715),
        borderRadius: BorderRadius.circular(su.setHeight(40)),
        margin: EdgeInsets.symmetric(vertical: su.setHeight(13)),
        padding: EdgeInsets.symmetric(vertical: su.setHeight(32)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: su.setWidth(22)),
              child: Text(
                '这个夏天必备神器',
                style: TextStyle(
                    color: hexToColor('#1b1b1b'),
                    fontSize: su.setSp(35),
                    letterSpacing: su.setWidth(7),
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppListItem(
              width: 960,
              showTag: false,
            ),
            AppListItem(
              width: 960,
              showTag: false,
            ),
            AppListItem(
              width: 960,
              showTag: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLatestCard() {
    return Center(
      child: CustomCard(
        width: su.setWidth(995),
        height: su.setHeight(349),
        borderRadius: BorderRadius.circular(su.setHeight(20)),
        margin: EdgeInsets.symmetric(vertical: su.setHeight(13)),
        padding: EdgeInsets.symmetric(horizontal: su.setWidth(80)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '最新应用',
              style: TextStyle(
                  color: hexToColor('#1b1b1b'),
                  fontSize: su.setSp(35),
                  fontWeight: FontWeight.bold,
                  letterSpacing: su.setWidth(7)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppLogoItem(),
                AppLogoItem(),
                AppLogoItem(),
                AppLogoItem(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildDisplaySwiper() {
    return Center(
      child: Container(
        width: su.setWidth(991),
        height: su.setHeight(601),
        margin: EdgeInsets.symmetric(vertical: su.setHeight(31)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(su.setHeight(20)),
          child: Swiper(
            itemBuilder: (c, i) => Container(
                width: su.setWidth(991),
                height: su.setHeight(601),
                color: Colors.red.withOpacity((i + 1) * 0.3)),
            autoplayDelay: 4000,
            autoplay: true,
            itemCount: 3,
            // pagination: SwiperPagination(),
            controller: SwiperController(),
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
