import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyInfoState();
  }
}

class MyInfoState extends State<MyInfo> {
  final asDriverUsername = TextEditingController();
  final asDriverPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter your username."),
                    controller: asDriverUsername,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter your password."),
                    controller: asDriverPassword,
                  ),
                  RaisedButton(
                    child: Text("Sign In"),
                    onPressed: () => _showData(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _showData(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              children: <Widget>[
                Text(asDriverUsername.text),
                Text(asDriverPassword.text),
              ],
            ),
          );
        });
  }
}
