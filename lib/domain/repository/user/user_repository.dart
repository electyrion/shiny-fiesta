import 'dart:async';

import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';

abstract class UserRepository {
  Future<UserList> getUsers();

  Future<List<User>> findUserById(int id);

  Future<int> insert(User user);

  Future<int> update(User user);

  Future<int> delete(User user);
}
