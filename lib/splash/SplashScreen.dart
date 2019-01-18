import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './../main.dart';
import './../home/viewmodel/HomeViewModel.dart';
import './../manager/BaseService.dart';
import './viewmodel/SplashScreenViewModel.dart';

final HomeViewModel viewModel = HomeViewModel(homeAPi: BaseService());

void main() {
  runApp(SplashScreen(viewModel: viewModel));
}

class SplashScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  SplashScreen({this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  var isSplash = true;
  final SplashScreenViewModel viewModel = SplashScreenViewModel();

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
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
        ),
      );
    } else {
      return ScopedModel<SplashScreenViewModel>(
        model: viewModel,
        child: MainPage(),
      );

    }
  }
}
