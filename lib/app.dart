import 'package:flutter/material.dart';
// import 'package:flutter_action_test_app/flutter_barcode_scanner/scanner.dart';
// import 'package:flutter_action_test_app/permission_handler/permission_handler.dart';
import 'package:flutter_action_test_app/platform_specific_code/platform_specific_code.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    // required this.firstCamera,
  });

  // final CameraDescription firstCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TakePictureScreen(
      //   camera: firstCamera,
      // ),
      // home: ImagePick(),
      // home: PermissionHandle(),
      // home: Scannaer(),
      home: PlatformSpecificCode(),
    );
  }
}
