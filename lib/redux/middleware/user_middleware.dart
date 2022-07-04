import 'dart:io';
import 'package:news_app/Model/post.dart';
import 'package:news_app/Networking/news_repository.dart';
import 'package:news_app/redux/actions/get_news_action.dart';
import 'package:news_app/redux/actions/user_actions.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/upload_repository.dart';
import 'package:news_app/networking/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:news_app/redux/app_state/app_state.dart';


ThunkAction<AppState> getUser = (Store<AppState> store) async {
  await UserRepository()
      .getUser()
      .then((response) => store.dispatch(GetUserAction(response)));
};

void updateUser(Store<AppState> store, File? image, String oldAvatar, String email, String name) async {
  var imageUrl = oldAvatar;
  if (image != null) {
    await UploadRepository().upload(image: image)
        .then((url) => imageUrl = url);
  }
  await UserRepository().updateUser(imageUrl, email, name)
        .then((user) => store.dispatch(UpdateUserAction(user)));
}

void getUserInfoById(Store<AppState> store, String userId) async {
  await UserRepository().getUserInfoById(userId)
      .then((user) => store.dispatch(GetUserInfoByIdAction(user)));
  await NewsRepository().getUserNews(userId)
      .then((response) => store.dispatch(GetAnotherUserNewsAction(response.content, response.numberOfElements)));
}