import 'package:flutter/material.dart';

import './../main.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  var isSplash = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isSplash = false;
      });
    });

    if (isSplash) {
      return Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "This's Splash Page",
            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
        ),
      );
    } else {
      return MainPage();
    }
  }
}
