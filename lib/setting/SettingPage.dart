import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stepper(steps: [
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
      Step(content: Text("content"), title: Text("title")),
    ]);
  }
}
