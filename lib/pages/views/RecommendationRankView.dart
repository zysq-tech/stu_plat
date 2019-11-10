import 'package:flutter/material.dart';

class RecommendationRankView extends StatefulWidget {
  @override
  _RecommendationRankViewState createState() => _RecommendationRankViewState();
}

class _RecommendationRankViewState extends State<RecommendationRankView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text('Leaderoard'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
