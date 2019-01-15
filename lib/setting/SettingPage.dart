import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }

//  Future<Null> _login() async {
//    FacebookLoginResult _facebookResult =
//        await _facebookLogin.logInWithReadPermissions(['email']);
//    switch (_facebookResult.status) {
//      case FacebookLoginStatus.loggedIn:
//        FacebookAccessToken token = _facebookResult.accessToken;
//        _showMessage(token.token);
//        break;
//      case FacebookLoginStatus.error:
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        break;
//    }
//  }
//
//  _showMessage(String token){
//    setState(() {
//      this.token = token;
//    });
//  }
}
