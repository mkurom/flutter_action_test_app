import 'package:flutter/material.dart';

import 'crypt_function.dart';

class EncryptPage extends StatefulWidget {
  EncryptPage({Key? key}) : super(key: key);

  @override
  _EncryptPageState createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('encrypt sample'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            crypyToWidget(),
            SizedBox(
              height: 100,
            ),
            Center(
              child: TextButton(
                onPressed: crypy,
                child: Text('crypt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
