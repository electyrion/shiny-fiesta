import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/user/store/user_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserListScreen extends StatefulWidget {
  final Function(User?) onUserSelected;

  UserListScreen({required this.onUserSelected});

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // stores:---------------------------------------------------------------------
  final UserStore _userStore = getIt<UserStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // check to see if already called api
    if (!_userStore.loading) {
      _userStore.getUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _userStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _userStore.userList != null
        ? ListView.separated(
            itemCount: _userStore.userList!.users!.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : Center(
            child: Text(
              AppLocalizations.of(context).translate('home_tv_no_post_found'),
            ),
          );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: NetworkImage(
          _userStore.userList?.users?[position].avatar ?? '',
        ),
      ),
      title: Text(
        '${_userStore.userList?.users?[position].firstName} ${_userStore.userList?.users?[position].lastName}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Text(
        '${_userStore.userList?.users?[position].email}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
      onTap: () {
        // set the current user in the UserStore
        widget.onUserSelected(_userStore.userList?.users![position]);
        Navigator.of(context).pop();
      },
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_userStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_userStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}