import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_apps/device_apps.dart' as device_app;
import 'package:stu_plat/data/index.dart';
import 'package:stu_plat/data/page_data.dart';

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
      this.installedPackageInfo,
      this.appInfoData});

  ApkStatus status;
  //downloadInfomation
  int startDownloadTime;
  double receivedBytes;
  double savedBytes;
  double totalBytes;
  final String appName;
  final String packageName;
  final String versionName;
  //packageInfomation
  device_app.ApplicationWithIcon installedPackageInfo;
  //remote app id
  final String appId;
  AppInfoData appInfoData;

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
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: su.setWidth(20)),
            child: Center(
                child: Column(
              children: <Widget>[
                buildDownloading([
                  buildManagementItem(
                      data: ApkData(status: ApkStatus.downloading)),
                  buildManagementItem(data: ApkData(status: ApkStatus.paused)),
                  buildManagementItem(
                      data: ApkData(status: ApkStatus.complete)),
                ]),
                buildUpdates([
                  buildManagementItem(
                      data: ApkData(status: ApkStatus.needUpgrade)),
                  buildManagementItem(
                      data: ApkData(status: ApkStatus.needUpgrade)),
                ]),
                buildInstalled([
                  buildManagementItem(
                      data: ApkData(status: ApkStatus.installed))
                ]),
              ],
            )),
          ))
        ],
      ),
    );
  }

  Widget buildDownloading(List<Widget> tasks) {
    return buildGeneralCard('任务进行中', tasks);
  }

  Widget buildInstalled(List<Widget> tasks) {
    return buildGeneralCard('已安装应用', tasks);
  }

  Widget buildUpdates(List<Widget> tasks) {
    return tasks.isNotEmpty
        ? CustomCard(
            width: su.setWidth(1016),
            padding: EdgeInsets.symmetric(
                vertical: su.setWidth(20), horizontal: su.setWidth(32)),
            borderRadius: BorderRadius.circular(su.setWidth(20)),
            margin: EdgeInsets.symmetric(vertical: su.setWidth(20)),
            child: ExpandablePanel(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              header: Text(
                '应用更新',
                style: TextStyle(
                    color: hexToColor('#626262'),
                    fontSize: su.setSp(50),
                    fontWeight: FontWeight.bold),
              ),
              iconColor: mainThemeColor,
              expanded: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'WLAN连接时自动更新',
                        style: TextStyle(
                            color: mainThemeColor,
                            fontSize: su.setSp(45),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: su.setWidth(20),
                              vertical: su.setWidth(10)),
                          child: Image.asset(
                            'assets/icon/icon_switch_off.png',
                            width: su.setWidth(96),
                            height: su.setWidth(96),
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomCard.cricleEnds(
                    width: su.setWidth(760),
                    height: su.setWidth(119),
                    boxShadow: CustomCard.noneBoxShadow,
                    color: mainThemeColor,
                    margin: EdgeInsets.symmetric(vertical: su.setWidth(20)),
                    child: FlatButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          '全部更新',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: su.setSp(60),
                          ),
                        ),
                      ),
                    ),
                  )
                ]..insertAll(1, tasks),
              ),
            ),
          )
        : Container();
  }

  Widget buildGeneralCard(String title, List<Widget> tasks) {
    return tasks.isNotEmpty
        ? CustomCard(
            width: su.setWidth(1016),
            padding: EdgeInsets.symmetric(vertical: su.setWidth(20)),
            borderRadius: BorderRadius.circular(su.setWidth(20)),
            margin: EdgeInsets.symmetric(vertical: su.setWidth(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: hexToColor('#626262'),
                      fontSize: su.setSp(50),
                      fontWeight: FontWeight.bold),
                ),
              ]..addAll(tasks),
            ),
          )
        : Container();
  }

  Widget buildManagementItem({
    @required ApkData data,
  }) {
    return GestureDetector(
      onTap: () {
        Application().navigateTo(context, Routes.appDetail,
            AppDetailPageData(appData: data.appInfoData));
      },
      child: Container(
        width: su.setWidth(950),
        height: su.setWidth(188),
        margin: EdgeInsets.symmetric(vertical: su.setWidth(10)),
        color: Colors.white,
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
