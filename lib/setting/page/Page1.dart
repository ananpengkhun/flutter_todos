import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("get back"),
          onPressed: () {
            Navigator.pop(context, "data from page1");
          },
        ),
      ),
    );
  }
}
