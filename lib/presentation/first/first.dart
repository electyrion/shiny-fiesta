import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/user/store/user_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF68B2A0), Color(0xFF4A88E1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildHeader(),
              const SizedBox(height: 32.0),
              _buildNameField(),
              const SizedBox(height: 16.0),
              _buildPalindromeField(),
              const SizedBox(height: 32.0),
              _buildCheckButton(),
              const SizedBox(height: 16.0),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.white.withOpacity(0.1),
      child: Icon(
        Icons.person_add,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  Widget _buildNameField() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPalindromeField() {
    return TextField(
      controller: _palindromeController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
        hintText: "Palindrome",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildCheckButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0),
        backgroundColor: Color.fromRGBO(58, 97, 121, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        "CHECK",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _showPalindromeResult(context);
      },
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16.0),
        backgroundColor: Color.fromRGBO(58, 97, 121, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        "NEXT",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (_nameController.text.isEmpty) {
          _showEmptyNameDialog(context);
        } else {
          _userStore.userLogin = User(firstName: _nameController.text);
          Navigator.of(context).pushNamed(Routes.second);
        }
      },
    );
  }

  bool isPalindrome(String text) {
    String cleanedText =
        text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  void _showPalindromeResult(BuildContext context) {
    bool result = isPalindrome(_palindromeController.text);
    String message =
        result ? "This is a palindrome!" : "This is not a palindrome.";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Palindrome Check"),
          content: Text(
            message,
            style: TextStyle(
              color: result ? Colors.green : Colors.red,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK", style: TextStyle(color: Colors.blueGrey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEmptyNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Name Required"),
          content: Text(
            "Please enter your name before proceeding.",
            style: TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK", style: TextStyle(color: Colors.blueGrey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
