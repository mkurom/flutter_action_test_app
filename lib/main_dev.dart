import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_action_test_app/app.dart';
import 'package:flutter_action_test_app/configs/config.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.environment = Flavor.DEVELOP;
  // flavor test
  FlavorConfig(
    color: Colors.blue,
    // location: BannerLocation.topStart,
    // variables: {
    //   "counter": 0,
    //   "baseUrl": "https://www.example1.com",
    // },
  );
  return runApp(MyApp());
}
