import 'dart:core';

import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// state
class MessageController {
  MessageController(this.message);
  List<String> message;
}

final messageProvider = StateNotifierProvider((ref) {
  return MessageProvider();
});

class MessageProvider extends StateNotifier<MessageController> {
  MessageProvider()
      : super(
          MessageController(
            [
              'aaaaa',
              'bbbbb',
              'ccccc',
              'ddddd',
              'eeeee',
              'fffff',
              'ggggg',
              'hhhhh',
              'iiiii',
            ],
          ),
        );
}
//

class TextFieldPage extends ConsumerWidget {
  const TextFieldPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(context),
      body: SafeArea(
        child: Column(
          children: [
            _messageList(context, messages as MessageController),
            _inputBar(context),
          ],
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // leading: IconButton(
      //   icon: const Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.black,
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
      title: Text(
        'Text Form Field',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _messageList(BuildContext context, MessageController messages) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Builder(
          builder: (context) {
            // notifierから取得する

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: messages.message.length,
              itemBuilder: (context, index) {
                return Bubble(
                  alignment:
                      (index % 2 == 0) ? Alignment.topRight : Alignment.topLeft,
                  nip:
                      (index % 2 == 0) ? BubbleNip.rightTop : BubbleNip.leftTop,
                  child: Container(
                    width: 120,
                    child: Text(
                      messages.message[index] + index.toString(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _inputBar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                hintText: 'メッセージを入力',
              ),
              maxLines: 10,
              minLines: 1,
              onChanged: (value) {
                //
              },
            ),
          ),
          Container(
            height: 62,
            child: TextButton(
              onPressed: () {
                //
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
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
                  fontSize: 14,
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
