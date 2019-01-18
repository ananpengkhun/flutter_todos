import 'package:flutter/material.dart';

import './promotion/Promotion.dart';
import './flashsale/FlashSale.dart';

class FlagPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FlagPageState();
  }
}

class _FlagPageState extends State<FlagPage>
    with SingleTickerProviderStateMixin {
  var _title = "Flash";

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handle);
  }

  void _handle() {
    setState(() {
      if (_tabController.index == 0) {
        _title = "Flash";
      } else {
        _title = "Promotion";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_title),
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
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FlashSale(),
          Promotion()
        ],
      ),
    );
  }
}
