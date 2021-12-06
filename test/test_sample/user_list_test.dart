import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_action_test_app/test_sample/user/user.dart';
import 'package:flutter_action_test_app/test_sample/user_list.dart';

void main() {
  // setUp関数でダミーデータを用意する
  UserList? userList;
  setUp(
    () => {
      userList = UserList(
        <User>[
          User(name: 'taro', year: 12),
          User(name: 'hanako', year: 13),
        ],
      ),
    },
  );

  // groupとtest関数を使用してテスト
  group('userList Test', () {
    //userListの初期値をテスト
    test('userList has 2 user data.', () {
      expect(userList!.userList.length, 2);
    });

    // userListに新たにuserを追加
    test('userList has 3 user data.', () {
      userList!.addUser(
        User(name: 'ziro', year: 14),
      );
      expect(userList!.userList.length, 3);
    });
  });
}
