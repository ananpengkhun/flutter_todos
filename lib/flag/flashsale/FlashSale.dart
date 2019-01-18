import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/services.dart';

class FlashSale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlashSaleState();
  }
}

class FlashSaleState extends State<FlashSale>
    with AutomaticKeepAliveClientMixin {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _batteryLevel = "Unknow battery";

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: RaisedButton(
              child: Text("RaisedButton"),
              onPressed: () {
                _getBatteryLevel();
              }),
        )
      ]),
      Text(_batteryLevel),
    ]);
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
