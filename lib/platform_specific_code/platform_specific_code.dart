import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// デバイスのバッテリーを取得する
class PlatformSpecificCode extends StatefulWidget {
  @override
  _PlatformSpecificCodeState createState() => _PlatformSpecificCodeState();
}

class _PlatformSpecificCodeState extends State<PlatformSpecificCode> {
  //Bundle IdentiferをMethodChannelの引数にセットする
  static const platform =
      MethodChannel('com.sample.flutter_action_test_app/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(
      () {
        _batteryLevel = batteryLevel;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Platform Specific Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
