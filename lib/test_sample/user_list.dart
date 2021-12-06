import 'package:flutter_action_test_app/test_sample/user/user.dart';

class UserList {
  final List<User> userList;

  const UserList(this.userList);

  List<User> get dataSource => userList;
  // List<User> get dataSource {
  //   return userList;
  // }

  void addUser(User user) {
    userList.add(user);
  }
}
