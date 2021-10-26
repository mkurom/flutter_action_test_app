import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandle extends StatefulWidget {
  const PermissionHandle({Key? key}) : super(key: key);

  @override
  _PermissionHandleState createState() => _PermissionHandleState();
}

class _PermissionHandleState extends State<PermissionHandle> {
  File? tempPhoto;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Pick'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  tempPhoto == null
                      ? Container()
                      : CircleAvatar(
                          radius: 84,
                          backgroundImage: FileImage(tempPhoto!),
                        ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: _getImage,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _getImage() async {
    var status = await Permission.camera.status;
    if (status == PermissionStatus.denied) {
      status = await Permission.camera.request();
    }
    // if (status.isLimited ||
    //     status.isDenied ||
    //     status.isRestricted ||
    //     status.isPermanentlyDenied) {
    //   await openAppSettings();
    //   return;
    // }
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        tempPhoto = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
