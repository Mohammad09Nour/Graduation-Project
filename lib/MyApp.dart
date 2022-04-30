import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/Login_page.dart';
import 'package:flutter_application_2/pages/RegisterPage.dart';
import 'package:flutter_application_2/pages/details_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "ff", home: LoginScreen());
  }
}
