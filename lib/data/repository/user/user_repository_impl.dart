import 'dart:async';

import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/data/local/datasources/user/user_datasource.dart';
import 'package:boilerplate/data/network/apis/users/user_api.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:sembast/sembast.dart';

class UserRepositoryImpl extends UserRepository {
  // data source object
  final UserDataSource _userDataSource;

  // api objects
  final UserApi _userApi;

  // constructor
  UserRepositoryImpl(this._userApi, this._userDataSource);

  // Post: ---------------------------------------------------------------------
  @override
  Future<UserList> getUsers() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _userApi.getPosts().then((usersList) {
      usersList.users?.forEach((post) {
        _userDataSource.insert(post);
      });

      return usersList;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<User>> findUserById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _userDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  @override
  Future<int> insert(User user) => _userDataSource
      .insert(user)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> update(User user) => _userDataSource
      .update(user)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> delete(User user) => _userDataSource
      .update(user)
      .then((id) => id)
      .catchError((error) => throw error);
}
