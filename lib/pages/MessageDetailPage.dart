import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Application.dart';
import '../data/page_data.dart';

class MessageDetailPage extends StatelessWidget {
  MessageDetailPage({@required this.data});

  final MessageDetailPageData data;

  @override
  Widget build(BuildContext context) {
    final ScreenUtil su = Application().screenUtil;
    final Color _color2 = hexToColor('#313131');
    final TextStyle _contentStyle = TextStyle(
        fontSize: su.setSp(30),
        color: hexToColor('#535353'),
        fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: su.setWidth(36)),
              child: Image.asset(
                'assets/icon/icon_service.png',
                width: su.setWidth(99),
                height: su.setWidth(99),
              ),
            ),
            Text.rich(
              TextSpan(
                text: '大学生应用试用平台',
                style: TextStyle(
                    color: _color2,
                    fontSize: su.setSp(50),
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '/',
                    style: TextStyle(
                        color: _color2,
                        fontSize: su.setSp(55),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '客服',
                    style: TextStyle(
                        color: _color2,
                        fontSize: su.setSp(40),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        leading: MaterialButton(
          child: Image.asset(
            'assets/icon/icon_return.png',
            width: su.setWidth(33),
            height: su.setWidth(61),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: su.setWidth(50), vertical: su.setWidth(60)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '尊敬的用户:',
              style: _contentStyle,
            ),
            Text(
              'Message Content ' * 20 + '.',
              style: _contentStyle,
            ),
            Padding(
              padding: EdgeInsets.only(top: su.setWidth(60)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '2019/12/25',
                    textAlign: TextAlign.right,
                    style: _contentStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
