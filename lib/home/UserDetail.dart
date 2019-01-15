import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final String name;

  UserDetail({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
