import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  RowAndColumnPage({
    Key? key,
  }) : super(key: key);

  final double radius = 20;
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: _appbar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              _timeLines(context),
              _inputBar(context),
            ],
          ),
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

  Widget _timeLines(BuildContext context) {
    return Expanded(
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
    );
  }

  Widget _inputBar(BuildContext context) {
    //
    return Container(
      // maxLines: 10を設定している状態でheightを設定すると、カーソルが見えない
      // maxLines: 1の時は問題ない（改行しないため）
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      color: Colors.blue,
      // constraints: BoxConstraints(
      //   minHeight: 32,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              cursorColor: Colors.white,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                // fillColor: Colors.white,
                // filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                // hintText: 'メッセージを入力',
              ),
              // Containerのheight: 60に設定している状態で、
              // コメントアウトを外すと、カーソルが見えない
              // maxLines: 10,
            ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () {
                print(_textEditingController.text);
                _textEditingController.clear();
                FocusScope.of(context).unfocus();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
              child: const Text(
                '送信',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
