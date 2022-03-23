import 'package:flutter/material.dart';
import 'package:flutter_action_test_app/image/image_page.dart';
import 'package:flutter_action_test_app/image_compress/image_comporess_page.dart';
import 'package:flutter_action_test_app/pull_to_refresh/pull_to_refresh_page.dart';
import 'package:flutter_action_test_app/memory_test/first_page.dart';
import 'package:flutter_action_test_app/route_aware/sample_page.dart';
import 'package:flutter_action_test_app/background_location/background_location.dart';
import 'package:flutter_action_test_app/custom_scroll_view/custom_scroll_view_page.dart';
import 'package:flutter_action_test_app/expansion_tile/expansion_tile_page.dart';
import 'package:flutter_action_test_app/pagenation_list_view/pagenation_list_view.dart';
import 'package:flutter_action_test_app/route_aware/route_aware_page.dart';
import 'package:flutter_action_test_app/route_aware/sample_page.dart';
import 'package:flutter_action_test_app/row_and_column/row_and_column_page.dart';
import 'package:flutter_action_test_app/test_sample/scroll/scroll_page.dart';
import 'package:flutter_action_test_app/flutter_barcode_scanner/scanner.dart';
import 'package:flutter_action_test_app/permission_handler/permission_handler.dart';
import 'package:flutter_action_test_app/platform_specific_code/platform_specific_code.dart';
import 'package:flutter_action_test_app/web_socket_channel/web_socket_channel.dart';
import 'package:flutter_action_test_app/text_form_field/text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_action_test_app/encrypt/encrypt_page.dart';

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
      // home: PlatformSpecificCode(),
      // home: DummyWebSocketPage(),
      // home: ProviderScope(child: TextFieldPage()),
      // home: FirstPage(),
      // home: DataPagerWithListView(),
      // home: RowAndColumnPage(),
      // home: ExpansionTilePage(),
      // home: ScrollPage(
      //   items: List<String>.generate(10000, (i) => "Item $i"),
      // ),
      // home: CustomScrollViewPage(),
      // home: BackgroundLocationApp(),
      // home: EncryptPage(),
      // home: FirstPage(),
      // home: BasicExample(),
      // home: FlutterImageCompressPage(),
      home: ImagePage(),
    );
  }
}
