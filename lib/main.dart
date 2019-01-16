import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './flag/FlagPage.dart';
import './home/HomePage.dart';
import './info/InfoPage.dart';
import './map/MapPage.dart';
import './setting/SettingPage.dart';
import 'home/viewmodel/HomeViewModel.dart';
import './manager/HomeAPi.dart';
import './manager/BaseService.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  String _title = "Home";
  TabController _tabController;
  final HomeViewModel viewModel = HomeViewModel(homeAPi: BaseService());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handle);

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.pink,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.map,
                  color: Colors.blue,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.flag,
                  color: Colors.blue,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
              ),
              Tab(
                child: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ScopedModel<HomeViewModel>(
              model: viewModel,
              child: HomePage(),
            ),
            MapPage(),
            FlagPage(),
            InfoPage(),
            SettingPage()
          ],
        ),
      ),
    );
  }

  void _handle() {
    setState(() {
      if (_tabController.index == 0) {
        _title = "Home";
      } else if (_tabController.index == 1) {
        _title = "Map";
      } else if (_tabController.index == 2) {
        _title = "Flash";
      } else if (_tabController.index == 3) {
        _title = "Info";
      } else {
        _title = "Settings";
      }
    });
  }

  Future loadData() async {
    await viewModel.setUser();
  }
}
