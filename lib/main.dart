import 'package:flutter/material.dart';

import './flag/FlagPage.dart';
import './home/HomePage.dart';
import './info/InfoPage.dart';
import './map/MapPage.dart';
import './setting/SettingPage.dart';

class MainPage extends StatefulWidget {
  MainPage();

  factory MainPage.forDesignTime() {
    // TODO: add arguments
    return new MainPage();
  }

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  var _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return HomePage();
                  } else if (index == 1) {
                    return MapPage();
                  } else if (index == 2) {
                    return FlagPage();
                  } else if (index == 3) {
                    return InfoPage();
                  } else {
                    return SettingPage();
                  }
                },
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                title: Text("Home"),
                icon: Icon(Icons.home),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                title: Text("Map"),
                icon: Icon(Icons.map),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                title: Text("Flag"),
                icon: Icon(Icons.flag),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                title: Text("Info"),
                icon: Icon(Icons.info),
                backgroundColor: Colors.deepPurple),
            BottomNavigationBarItem(
                title: Text("Settings"),
                icon: Icon(Icons.settings),
                backgroundColor: Colors.deepPurple)
          ],
          onTap: _onItemTab,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }

  void _onItemTab(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
    setState(() {
      _currentIndex = index;
    });
  }
}
