import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () => navigatePage(context, 1),
          child: Text("page1"),
        ),
        RaisedButton(
          onPressed: () => navigatePage(context, 2),
          child: Text("page2"),
        ),
        RaisedButton(
          onPressed: () => navigatePage(context, 3),
          child: Text("page3"),
        ),
        RaisedButton(
          onPressed: () => navigatePage(context, 4),
          child: Text("page4"),
        ),
      ],
    );
  }

  navigatePage(BuildContext context, int page) async{
    switch (page) {
      case 1:
        var result = await Navigator.pushNamed(context, '/page1');
        print("navigatePage : $result");
        break;
      case 2:
        Navigator.pushNamed(context, '/page2');
        break;
      case 3:
        Navigator.pushNamed(context, '/page3');
        break;
      case 4:
        Navigator.pushNamed(context, '/page4');
        break;
    }
  }
}
