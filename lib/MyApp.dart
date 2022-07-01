import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/create_Post.dart';
import 'package:flutter_application_2/pages/edit_my_profile_page.dart';
import 'package:flutter_application_2/pages/edit_personal_info.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/login_screen.dart';
import 'package:flutter_application_2/pages/profil_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "ff", home: CreatePost());
  }
}
