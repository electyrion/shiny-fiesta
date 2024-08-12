import 'package:boilerplate/presentation/home/home.dart';
import 'package:boilerplate/presentation/second/second.dart';
import 'package:boilerplate/presentation/third/third.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String second = '/second';
  static const String third = '/third';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => HomeScreen(),
    second: (BuildContext context) => SecondScreen(),
    third: (BuildContext context) => ThirdScreen(),
  };
}
