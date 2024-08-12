import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecase/user/get_user_usecase.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(this._getUserUseCase, this.errorStore);

  // use cases:-----------------------------------------------------------------
  final GetUserUseCase _getUserUseCase;

  // stores:--------------------------------------------------------------------
  // store for handling errors
  final ErrorStore errorStore;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<UserList?> emptyUserResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UserList?> fetchUsersFuture =
      ObservableFuture<UserList?>(emptyUserResponse);

  @observable
  UserList? userList;

  @observable
  bool isUserListEmpty = false;

  @observable
  User? userLogin;

  @observable
  User? userSelected;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchUsersFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getUsers() async {
    final future = _getUserUseCase.call(params: null);
    fetchUsersFuture = ObservableFuture(future);

    future.then((userList) {
      this.userList = userList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
