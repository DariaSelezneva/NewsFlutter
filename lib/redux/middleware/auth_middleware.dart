import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app/Networking/login_repository.dart';
import 'package:news_app/redux/actions/auth_actions.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/register_repository.dart';
import 'package:news_app/networking/upload_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:news_app/redux/app_state/app_state.dart';


ThunkAction<AppState> getToken = (Store<AppState> store) async {
  await FlutterSecureStorage()
      .read(key: 'token')
      .then((token) => store.dispatch(GetTokenAction(token)));
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

void register(Store<AppState> store, File? image, String email, String name, String password) async {
  var imageUrl = "https://news-feed.dunice-testing.com/api/v1/file/693d86bf-fedd-47e8-8f00-332780ab46b8.";
  if (image != null) {
    await UploadRepository().upload(image: image)
        .then((url) => imageUrl = url);
  }
  await RegisterRepository().register(avatar: imageUrl, email: email, name: name, password: password)
      .then((authResponse) => store.dispatch(
      RegisterAction(
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