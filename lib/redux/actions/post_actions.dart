import 'package:news_app/Model/post.dart';

class CreatePostAction {
  final Post _post;
  Post get post => _post;
  CreatePostAction(this._post);
}

class UpdatePostAction {
  final Post _post;
  Post get post => _post;
  UpdatePostAction(this._post);
}

class DeletePostAction {
  final int _postId;
  int get postId => _postId;
  DeletePostAction(this._postId);
}