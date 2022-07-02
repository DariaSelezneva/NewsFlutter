import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/app_state/app_state.dart';
import 'package:news_app/middleware/user_middleware.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/profile/login_screen.dart';
import 'package:news_app/view/profile/user_screen.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        onInit: (store) => store.dispatch(getToken),
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            body: state.token == null ?
              const LoginScreen() :
              UserScreen());
        }
    );
  }
}