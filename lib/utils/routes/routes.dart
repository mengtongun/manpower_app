import 'package:app/presentation/home/home.dart';
import 'package:app/presentation/login/login.dart';
import 'package:app/presentation/register/register.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/employee';

  static final routes = <String, WidgetBuilder>{
    register: (BuildContext context) => RegisterScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
