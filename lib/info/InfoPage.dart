import 'package:flutter/material.dart';

import './mine/MyInfo.dart';
import './recommended/RecommendInfo.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoPageState();
  }
}

class _InfoPageState extends State<InfoPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Info"),
          ),
          bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.flag),
                ),
                Tab(
                  child: Icon(Icons.report_problem),
                ),
              ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[MyInfo(), Recommend()],
        ),
      ),);
  }

}