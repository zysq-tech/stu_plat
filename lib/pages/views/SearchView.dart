import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Application.dart';
import '../../components/customCard.dart';
import '../../components/appListItem.dart';
import '../../data/page_data.dart';

class SearchView extends SearchDelegate {
  SearchView({String hintText})
      : super(searchFieldLabel: hintText, keyboardType: TextInputType.text) {
    su = Application().screenUtil;
    hotSearch = List<String>.generate(7, (index) => 'App $index');
  }

  ScreenUtil su;

  List<String> hotSearch;

  List<String> allData = [
    'asd',
    'zxc',
    'qwe',
    'bbb',
    'qqq',
    'qaz',
    'wsx',
    'edc'
  ];

  void searchOnTap(BuildContext context, String searchText) {
    query = searchText;
    showResults(context);
  }

  Widget buildHotSearchList(BuildContext context) {
    List<List<String>> children = List<List<String>>.generate(
        3,
        (x) => List<String>.generate(3,
            (y) => x * 3 + y < hotSearch.length ? hotSearch[x * 3 + y] : ''));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map((l) => Row(
                children: l
                    .map((s) => Expanded(
                          child: s.isEmpty
                              ? Container(
                                  height: su.setWidth(83),
                                )
                              : buildHotSearchItem(context, s),
                        ))
                    .toList(),
              ))
          .toList()
            ..insert(
                0,
                Row(
                  children: <Widget>[
                    Text(
                      '热搜应用',
                      style: TextStyle(
                          color: hexToColor('#434343'),
                          fontSize: su.setSp(35),
                          letterSpacing: su.setWidth(3.5),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
    );
  }

  Widget buildHotSearchItem(BuildContext context, String s) {
    return Container(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => searchOnTap(context, s),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: su.setWidth(30), vertical: su.setWidth(10)),
          decoration: BoxDecoration(
              color: mainThemeColor,
              borderRadius: BorderRadius.circular(su.setWidth(40))),
          child: Text(
            s,
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
                color: Colors.white,
                fontSize: su.setSp(38),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      MaterialButton(
        child: Image.asset(
          'assets/icon/icon_search.png',
          width: su.setWidth(60),
          height: su.setWidth(60),
        ),
        onPressed: () {
          showResults(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return MaterialButton(
      child: Image.asset(
        'assets/icon/icon_return.png',
        width: su.setWidth(33),
        height: su.setWidth(61),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.expand(
      child: FutureBuilder<String>(
          future: Future.delayed(Duration(milliseconds: 800), () => '$query'),
          builder: (context, snapshot) {
            return Center(
              child: snapshot.data == null
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.symmetric(vertical: su.setWidth(30)),
                      itemBuilder: (_, index) => AppListItem(
                        margin: EdgeInsets.symmetric(
                          vertical: su.setWidth(20),
                        ),
                        onTap: () {
                          var str = fluroCnParamsEncode(
                              objectToJson(AppDetailPageData()));
                          Application().router.navigateTo(
                              context, '${Routes.appDetail}?data=$str');
                        },
                      ),
                    ),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String q = query;
    var list = allData.where((s) => s.contains(q));
    return SizedBox.expand(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CustomCard(
                width: su.setWidth(1080),
                height: su.setWidth(491),
                boxShadow: CustomCard.noneBoxShadow,
                padding: EdgeInsets.symmetric(
                    horizontal: su.setWidth(46), vertical: su.setWidth(36)),
                border: Border(
                    top: BorderSide(color: homeBgColor, width: su.setWidth(20)),
                    bottom:
                        BorderSide(color: homeBgColor, width: su.setWidth(20))),
                child: buildHotSearchList(context),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (_context, index) => index % 2 == 0
                      ? ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: su.setWidth(50)),
                          onTap: () =>
                              searchOnTap(_context, 'Search History $index'),
                          leading: Icon(
                            Icons.history,
                            size: su.setWidth(60),
                          ),
                          title: Text(
                            'Search History $index',
                            softWrap: false,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: hexToColor('#626262'),
                                fontSize: su.setSp(40),
                                letterSpacing: su.setWidth(4)),
                          ),
                        )
                      : Divider(
                          color: hexToColor('#bfbfbf'),
                          thickness: su.setWidth(2),
                          indent: su.setWidth(50),
                          endIndent: su.setWidth(50),
                        ),
                ),
              )
            ],
          ),
          q.length == 0 || list.length == 0
              ? Container()
              : Container(
                  width: su.setWidth(1080),
                  padding: EdgeInsets.symmetric(
                      horizontal: su.setWidth(64), vertical: su.setWidth(40)),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: list
                        .map((t) => buildQuerySuggestionItem(context, t))
                        .toList(),
                  ),
                )
        ],
      ),
    );
  }

  Widget buildQuerySuggestionItem(BuildContext context, String text) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => searchOnTap(context, text),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: su.setWidth(50)),
              child: Image.asset(
                'assets/icon/icon_search.png',
                width: su.setWidth(47),
                height: su.setWidth(47),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: su.setWidth(20)),
                  child: Text(
                    text,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: hexToColor('#434343'),
                        fontSize: su.setSp(35),
                        letterSpacing: su.setWidth(3.5)),
                  ),
                ),
                Divider(
                  color: hexToColor('#bfbfbf'),
                  thickness: su.setWidth(2),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}
