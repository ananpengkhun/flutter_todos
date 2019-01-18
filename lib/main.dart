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
import './setting/page/Page1.dart';
import './setting/page/Page2.dart';
import './setting/page/Page3.dart';
import './setting/page/Page4.dart';

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
  int count = 0;
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
      routes: {
        '/page1' : (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: ScopedModel(
            model: viewModel,
            child: ScopedModelDescendant<HomeViewModel>(
              builder: (context, child, model) {
                return Text("${model.counter}");
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pressFloating,
          child: Icon(Icons.exposure_plus_1),
        ),
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
          physics: NeverScrollableScrollPhysics(),
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

  void _pressFloating() {
    viewModel.plus();
  }
}
