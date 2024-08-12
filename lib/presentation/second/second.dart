import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/first/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/user/store/user_store.dart';
import 'package:boilerplate/presentation/user/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildDivider(),
        Column(
          children: <Widget>[
            _buildUserInfoSection(),
            _buildChooseUserButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      color: Colors.grey,
    );
  }

  Widget _buildUserInfoSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildWelcomeText(),
            _buildUserNameText(),
            Expanded(child: Container()),
            _buildSelectedUserSection(),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      "Welcome",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _buildUserNameText() {
    return Text(
      _userStore.userLogin != null
          ? "${_userStore.userLogin?.firstName}"
          : "Name not found",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSelectedUserSection() {
    if (_userStore.userSelected != null) {
      return Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_userStore.userSelected!.avatar ?? ''),
            ),
            SizedBox(height: 16.0),
            Text(
              "${_userStore.userSelected?.firstName} ${_userStore.userSelected?.lastName}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              _userStore.userSelected?.email ?? "Email not found",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Text(
          "Selected User Name",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _buildChooseUserButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(58, 97, 121, 1),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserListScreen(
                onUserSelected: (selectedUser) {
                  setState(() {
                    _userStore.userSelected = selectedUser;
                  });
                },
              ),
            ),
          );
        },
        child: Text(
          "Choose a User",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text("Second Screen"),
      centerTitle: true,
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      _buildThemeButton(),
    ];
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }
}
