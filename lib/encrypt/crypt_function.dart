import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';

void crypy() {
  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  final key = encrypt.Key.fromSecureRandom(32);
  final iv = encrypt.IV.fromSecureRandom(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  print(decrypted);
  print(encrypted.bytes);
  print(encrypted.base16);
  print(encrypted.base64);
}

Widget crypyToWidget() {
  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  final key = encrypt.Key.fromSecureRandom(32);
  final iv = encrypt.IV.fromSecureRandom(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  return Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text('encrypted'),
      SizedBox(height: 10),
      Text(encrypted.base16),
      SizedBox(height: 10),
      Text(encrypted.base64),
      SizedBox(
        height: 50,
      ),
      Text('decrypted'),
      SizedBox(height: 10),
      Text(decrypted),
    ],
  );
}
