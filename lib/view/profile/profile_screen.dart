import 'package:flutter/material.dart';
import 'package:news_app/view/profile/login_screen.dart';
import 'package:news_app/view/profile/user_screen.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key, this.token}) : super(key: key);

  final String? token;

  @override
  Widget build(BuildContext context) {
    return token == null ?
    const LoginScreen() :
    const UserScreen();
  }
}