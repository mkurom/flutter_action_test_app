import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
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

  Future<void> _getImage() async {
    final imageFile = await showCupertinoModalPopup<XFile>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => _picker
                .pickImage(
                  source: ImageSource.camera,
                  maxWidth: 512,
                  maxHeight: 512,
                )
                .then((value) => Navigator.of(ctx).pop(value)),
            child: const Text('カメラ'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => _picker
                .pickImage(
                  source: ImageSource.gallery,
                  maxWidth: 512,
                  maxHeight: 512,
                )
                .then((value) => Navigator.of(ctx).pop(value)),
            child: const Text('フォトライブラリ'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(ctx).pop(),
          child: const Text('キャンセル'),
        ),
      ),
    );

    if (imageFile == null) {
      setState(
        () {
          tempPhoto = null;
        },
      );
    } else {
      setState(
        () {
          tempPhoto = File(imageFile.path);
        },
      );
    }
  }
}
