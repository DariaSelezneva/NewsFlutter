import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app/Networking/login_repository.dart';
import 'package:news_app/actions/user_actions.dart';
import 'package:news_app/networking/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:news_app/app_state.dart';

ThunkAction<AppState> getToken = (Store<AppState> store) async {
  await FlutterSecureStorage()
      .read(key: 'token')
      .then((token) => store.dispatch(GetTokenAction(token)));
};

ThunkAction<AppState> getUser = (Store<AppState> store) async {
  await UserRepository()
      .getUser()
      .then((response) => store.dispatch(GetUserAction(response)));
};