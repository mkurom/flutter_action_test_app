import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image;
  final picker = ImagePicker();
  var isLoading = false;

  // convert jpg to png
  Future<void> convertImage() async {
    // 空ファイル生成
    final replacedPath = image!.path.replaceAll('.jpg', '.png');
    final newImage = File(replacedPath);

    // imageを使用した方法
    // final decodeImage = img.decodeImage(image!.readAsBytesSync())!;
    // newImage.writeAsBytesSync(img.encodePng(decodeImage));

    // flutter_image_compressを使用した方法
    final result = await FlutterImageCompress.compressWithFile(
      image!.absolute.path,
      minWidth: 640,
      minHeight: 480,
      quality: 80,
      format: CompressFormat.png,
    );
    newImage.writeAsBytesSync(result!);

    print(image!.path);
    print(newImage.path);

    setState(() {
      image = newImage;
    });
    print(image!.path);
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print('path: ${pickedFile.path}');
      image = File(pickedFile.path);
    } else {
      //
    }
    setState(() {});
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print('path: ${pickedFile.path}');
      image = File(pickedFile.path);
    } else {
      //
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: const CircularProgressIndicator(),
            )
          : Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black87,
                        ),
                        onPressed: getImageFromCamera,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.image_outlined,
                          color: Colors.black87,
                        ),
                        onPressed: getImageFromGallery,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        icon: Icon(
                          Icons.cached,
                          color: Colors.black87,
                        ),
                        onPressed: image == null ? null : convertImage,
                      ),
                    ),
                    image == null
                        ? Container()
                        : SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.file(
                              image!,
                              fit: BoxFit.contain,
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
