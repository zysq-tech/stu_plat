import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_apps/device_apps.dart' as device_app;

import '../../Application.dart';
import '../../components/customCard.dart';

enum ApkStatus { downloading, paused, complete, installed, needUpgrade }

class ApkData {
  ApkData(
      {this.appId,
      @required this.status,
      this.startDownloadTime,
      this.receivedBytes = 0,
      this.savedBytes = 0,
      this.totalBytes = double.infinity,
      this.appName,
      this.packageName,
      this.versionName,
      this.installedPackageInfo});

  final ApkStatus status;
  //downloadInfomation
  final int startDownloadTime;
  final double receivedBytes;
  final double savedBytes;
  final double totalBytes;
  final String appName;
  final String packageName;
  final String versionName;
  //packageInfomation
  final device_app.ApplicationWithIcon installedPackageInfo;
  //remote app id
  final String appId;

  //TODO speed algorithm
  String get downloadSpeed => formatBytesSize(startDownloadTime == null
      ? 0
      : receivedBytes / DateTime.now().millisecondsSinceEpoch -
          startDownloadTime);

  double get downloadProgress => savedBytes / totalBytes;

  bool get isDone => ApkStatus.values.indexOf(status) > 1;

  String get totalSize => formatBytesSize(totalBytes);

  String get savedSize => formatBytesSize(savedBytes);
}

class ManagementView extends StatefulWidget {
  @override
  _ManagementViewState createState() => _ManagementViewState();
}

class _ManagementViewState extends State<ManagementView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  ScreenUtil su;

  TextStyle _smallTextStyle;

  @override
  void initState() {
    super.initState();
    su = Application().screenUtil;
    _smallTextStyle =
        TextStyle(color: hexToColor('#262626'), fontSize: su.setSp(26));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: su.setWidth(1080),
      color: homeBgColor,
      child: Column(
        children: <Widget>[
          Container(
            width: su.setWidth(1080),
            height: su.setWidth(108),
            padding: EdgeInsets.symmetric(horizontal: su.setWidth(50)),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: CustomCard.noneBoxShadow,
              border: Border(
                  bottom: BorderSide(color: hexToColor('#dcdcdc'), width: 2)),
            ),
            child: Text(
              '下载任务',
              style: TextStyle(
                  color: mainThemeColor,
                  fontSize: su.setSp(55),
                  letterSpacing: su.setWidth(5.5),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: su.setWidth(10)),
              itemCount: ApkStatus.values.length,
              itemBuilder: (_, index) => buildManagementItem(
                  data: ApkData(status: ApkStatus.values[index])),
            ),
          )
        ],
      ),
    );
  }

  Widget buildManagementItem({
    @required ApkData data,
  }) {
    return Center(
      child: CustomCard(
        width: su.setWidth(1016),
        height: su.setWidth(188),
        margin: EdgeInsets.symmetric(vertical: su.setWidth(15)),
        borderRadius: BorderRadius.circular(su.setWidth(20)),
        padding: EdgeInsets.symmetric(horizontal: su.setWidth(32)),
        child: Row(
          children: <Widget>[
            CustomCard(
              width: su.setWidth(144),
              height: su.setWidth(144),
              borderRadius: BorderRadius.circular(su.setWidth(20)),
              // color: Colors.grey,
              boxShadow: CustomCard.noneBoxShadow,
              image: getDefaultIcon(),
            ),
            Expanded(
                child: Container(
              width: su.setWidth(564),
              margin: EdgeInsets.only(
                  left: su.setWidth(50), right: su.setWidth(35)),
              padding: EdgeInsets.symmetric(vertical: su.setWidth(32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${data.installedPackageInfo?.appName ?? data.appName ?? 'App Name '}',
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: hexToColor('#262626'), fontSize: su.setSp(35)),
                  ),
                ]..addAll(data.isDone
                    ? [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: su.setWidth(60)),
                              child: Text(
                                '${data.totalSize}',
                                style: _smallTextStyle,
                              ),
                            ),
                            Text(
                              '版本: ${(data.status == ApkStatus.installed ? data.installedPackageInfo?.versionName : data.versionName) ?? '0.0.1'}',
                              style: _smallTextStyle,
                            ),
                          ],
                        ),
                      ]
                    : [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data.status == ApkStatus.paused
                                  ? '已暂停'
                                  : '${data.downloadSpeed}/s',
                              style: _smallTextStyle,
                            ),
                            Text(
                              '${data.savedSize}/${data.totalSize}',
                              style: _smallTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: su.setWidth(9),
                          child: LinearProgressIndicator(
                            backgroundColor: hexToColor('#bfbfbf'),
                            value: data.downloadProgress,
                          ),
                        )
                      ]),
              ),
            )),
            CustomCard(
              width: su.setWidth(152),
              height: su.setWidth(62),
              color: data.status == ApkStatus.downloading
                  ? hexToColor('#8a8a8a')
                  : mainThemeColor,
              boxShadow: CustomCard.noneBoxShadow,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  getOperateBtnText(data),
                  style: TextStyle(fontSize: su.setSp(26), color: Colors.white),
                ),
              ),
              borderRadius: BorderRadius.circular(su.setWidth(10)),
            )
          ],
        ),
      ),
    );
  }

  String getOperateBtnText(ApkData data) {
    return const [
      '暂停',
      '继续',
      '安装',
      '打开',
      '升级'
    ][ApkStatus.values.indexOf(data.status)];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
