import 'dart:async';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  UserApi(this._dioClient);

  /// Returns list of post in response
  Future<UserList> getPosts() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getUsers);
      return UserList.fromJson(res.data['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

/// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}
