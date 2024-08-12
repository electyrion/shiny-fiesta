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

  @observable
  int currentPage = 1;

  @computed
  bool get loading => fetchUsersFuture.status == FutureStatus.pending;

  @action
  Future getUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    GetUserUseCaseParams params = GetUserUseCaseParams(page: currentPage);
    final future = _getUserUseCase.call(params: params);
    fetchUsersFuture = ObservableFuture(future);

    future.then((userList) {
      if (isRefresh) {
        this.userList = userList;
      } else {
        if (this.userList != null) {
          this.userList!.users!.addAll(userList.users!);
        } else {
          this.userList = userList;
        }
      }
      if (this.userList!.users!.isEmpty) {
        isUserListEmpty = true;
      } else {
        isUserListEmpty = false;
      }
      currentPage++;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future loadNextPage() async {
    if (!loading) {
      getUsers();
    }
  }

  @action
  Future refreshUsers() async {
    await getUsers(isRefresh: true);
  }
}

