import 'dart:io';
import 'package:news_app/Model/post.dart';
import 'package:news_app/redux/actions/post_actions.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/upload_repository.dart';
import 'package:news_app/networking/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:news_app/redux/app_state/app_state.dart';


void createPost(Store<AppState> store, User user, File? image, String title, String description, List<String> tags) async {
  var imageUrl = "https://news-feed.dunice-testing.com/api/v1/file/693d86bf-fedd-47e8-8f00-332780ab46b8.";
  if (image != null) {
    await UploadRepository().upload(image: image)
        .then((url) => imageUrl = url);
  }
  await UserRepository().createPost(imageUrl, title, description, tags)
      .then((id) =>
      store.dispatch(
          CreatePostAction(
              Post(id: id,
                  userId: user.id,
                  title: title,
                  description: description,
                  image: imageUrl,
                  username: user.name,
                  tags: tags))));
}

void updatePost(Store<AppState> store, User user, int postId, File? image, String oldImageUrl, String title, String description, List<String> tags) async {
  var imageUrl = oldImageUrl;
  if (image != null) {
    await UploadRepository().upload(image: image)
        .then((url) => imageUrl = url);
  }
  await UserRepository().updatePost(postId, imageUrl, title, description, tags)
      .then((success) =>
      store.dispatch(
          UpdatePostAction(
              Post(id: postId,
                  userId: user.id,
                  title: title,
                  description: description,
                  image: imageUrl,
                  username: user.name,
                  tags: tags))));
}

void deletePost(Store<AppState> store, int postId) async {
  await UserRepository().deletePost(postId)
      .then((success) => store.dispatch(DeletePostAction(postId)));
}