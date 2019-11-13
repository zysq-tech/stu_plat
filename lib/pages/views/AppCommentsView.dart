import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../data/apps.dart';

class AppCommentsView extends StatefulWidget {
  AppCommentsView({@required this.data});

  final AppInfoData data;

  @override
  _AppCommentsViewState createState() => _AppCommentsViewState();
}

class _AppCommentsViewState extends State<AppCommentsView>
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
      padding: EdgeInsets.symmetric(
          horizontal: su.setWidth(56), vertical: su.setWidth(50)),
      itemCount: 13,
      itemBuilder: (_, index) => index == 0
          ? Padding(
              padding: EdgeInsets.only(bottom: su.setWidth(50)),
              child: Text(
                '全部评论',
                style: TextStyle(
                    color: mainThemeColor,
                    fontSize: su.setSp(50),
                    fontWeight: FontWeight.bold),
              ),
            )
          : buildCommentItem(),
    );
  }

  Widget buildCommentItem({AppCommentData data}) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: su.setWidth(50)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: su.setWidth(40)),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: su.setWidth(63),
              backgroundImage: AssetImage('assets/icon/icon_service.png'),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: su.setWidth(25)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          data?.userInfo?.nickName ?? 'User Name',
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: hexToColor('#313131'),
                              fontSize: su.setSp(45),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(data?.createtime ?? '2019/1/1 00:00',
                          style: TextStyle(
                            color: hexToColor('#626262'),
                            fontSize: su.setSp(35),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: su.setWidth(27)),
                  child: Text(
                    'UserCommentContent' * 10,
                    style: TextStyle(
                        color: hexToColor('#626262'),
                        fontSize: su.setSp(35),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    RatingBar(
                      itemBuilder: (_, index) => Icon(
                        Icons.star,
                        color: mainThemeColor,
                      ),
                      ignoreGestures: true,
                      itemCount: 5,
                      unratedColor: Colors.grey,
                      initialRating: data?.praiseScore ?? 1.0,
                      itemSize: su.setWidth(45),
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: su.setWidth(12)),
                      onRatingUpdate: (d) {},
                    ),
                    Text(
                      '(${(data?.praiseScore ?? 1.0).toStringAsFixed(1)}分)',
                      style: TextStyle(
                          color: hexToColor('#626262'),
                          fontSize: su.setSp(35),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
