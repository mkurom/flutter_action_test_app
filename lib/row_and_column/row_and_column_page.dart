import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  const RowAndColumnPage({
    Key? key,
  }) : super(key: key);

  final double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: 6,
          itemBuilder: (context, index) {
            // 送信側
            if (index % 2 == 0) {
              return Container(
                padding: const EdgeInsets.all(6),
                // Rowを２つ重ねて、アイコンとテキスト、日付の組み合わせにする
                // Lineのようなタイムラインを作成する時に使用する
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          DateTime.parse('20210101').toString(),
                        ),
                        Container(
                          width: 100,
                          child: Text(
                              'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: radius,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                        ),
                        child: SizedBox(
                          height: radius * 2,
                          width: radius * 2,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // 受信側
              return Container(
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: radius,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: SizedBox(
                          height: radius * 2,
                          width: radius * 2,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                              'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb'),
                        ),
                        Text(
                          DateTime.parse('20210101').toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          // Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Row Column Page',
      ),
    );
  }
}
