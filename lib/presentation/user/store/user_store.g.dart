// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_UserStore.loading'))
      .value;

  late final _$fetchUsersFutureAtom =
      Atom(name: '_UserStore.fetchUsersFuture', context: context);

  @override
  ObservableFuture<UserList?> get fetchUsersFuture {
    _$fetchUsersFutureAtom.reportRead();
    return super.fetchUsersFuture;
  }

  @override
  set fetchUsersFuture(ObservableFuture<UserList?> value) {
    _$fetchUsersFutureAtom.reportWrite(value, super.fetchUsersFuture, () {
      super.fetchUsersFuture = value;
    });
  }

  late final _$userListAtom =
      Atom(name: '_UserStore.userList', context: context);

  @override
  UserList? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(UserList? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$isUserListEmptyAtom =
      Atom(name: '_UserStore.isUserListEmpty', context: context);

  @override
  bool get isUserListEmpty {
    _$isUserListEmptyAtom.reportRead();
    return super.isUserListEmpty;
  }

  @override
  set isUserListEmpty(bool value) {
    _$isUserListEmptyAtom.reportWrite(value, super.isUserListEmpty, () {
      super.isUserListEmpty = value;
    });
  }

  late final _$userLoginAtom =
      Atom(name: '_UserStore.userLogin', context: context);

  @override
  User? get userLogin {
    _$userLoginAtom.reportRead();
    return super.userLogin;
  }

  @override
  set userLogin(User? value) {
    _$userLoginAtom.reportWrite(value, super.userLogin, () {
      super.userLogin = value;
    });
  }

  late final _$userSelectedAtom =
      Atom(name: '_UserStore.userSelected', context: context);

  @override
  User? get userSelected {
    _$userSelectedAtom.reportRead();
    return super.userSelected;
  }

  @override
  set userSelected(User? value) {
    _$userSelectedAtom.reportWrite(value, super.userSelected, () {
      super.userSelected = value;
    });
  }

  late final _$successAtom = Atom(name: '_UserStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_UserStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_UserStore.getUsers', context: context);

  @override
  Future<dynamic> getUsers({bool isRefresh = false}) {
    return _$getUsersAsyncAction
        .run(() => super.getUsers(isRefresh: isRefresh));
  }

  late final _$loadNextPageAsyncAction =
      AsyncAction('_UserStore.loadNextPage', context: context);

  @override
  Future<dynamic> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  late final _$refreshUsersAsyncAction =
      AsyncAction('_UserStore.refreshUsers', context: context);

  @override
  Future<dynamic> refreshUsers() {
    return _$refreshUsersAsyncAction.run(() => super.refreshUsers());
  }

  @override
  String toString() {
    return '''
fetchUsersFuture: ${fetchUsersFuture},
userList: ${userList},
isUserListEmpty: ${isUserListEmpty},
userLogin: ${userLogin},
userSelected: ${userSelected},
success: ${success},
currentPage: ${currentPage},
loading: ${loading}
    ''';
  }
}
