import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app/Networking/login_repository.dart';
import 'package:news_app/actions/user_actions.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/upload_repository.dart';
import 'package:news_app/networking/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:news_app/app_state/app_state.dart';

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

void login(Store<AppState> store, String email, String password) async {
  await LoginRepository().login(email: email, password: password)
      .then((authResponse) => store.dispatch(
        LoginAction(
          User(
              id: authResponse.id,
              avatar: authResponse.avatar,
              email: authResponse.email,
              name: authResponse.name),
              authResponse.token)));
}

ThunkAction<AppState> logout = (Store<AppState> store) async {
  await FlutterSecureStorage()
      .delete(key: 'token')
      .then(store.dispatch(LogoutAction()));
};

void updateUser(Store<AppState> store, File? image, String oldAvatar, String email, String name) async {
  if (image != null) {
    await UploadRepository().upload(image: image)
        .then((url) {
      UserRepository().updateUser(url, email, name)
          .then((user) => store.dispatch(UpdateUserAction(user)));
    });
  }
  else {
    UserRepository().updateUser(oldAvatar, email, name)
        .then((user) => store.dispatch(UpdateUserAction(user)));
  }
}