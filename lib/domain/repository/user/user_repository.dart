import 'dart:async';

import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';
import 'package:boilerplate/domain/usecase/user/get_user_usecase.dart';

abstract class UserRepository {
  Future<UserList> getUsers(GetUserUseCaseParams params);

  Future<List<User>> findUserById(int id);

  Future<int> insert(User user);

  Future<int> update(User user);

  Future<int> delete(User user);
}
