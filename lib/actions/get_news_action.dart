import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';

class GetNewsAction {

  final List<Post> _news;
  final int _numberOfElements;

  List<Post> get news => _news;
  int get numberOfElements => _numberOfElements;

  GetNewsAction(this._news, this._numberOfElements);

}

class LoadMoreAction extends GetNewsAction {
  LoadMoreAction(_news, _numberOfElements) : super(_news, _numberOfElements);
}

class GetUserNewsAction extends GetNewsAction {
  GetUserNewsAction(_news, _numberOfElements) : super(_news, _numberOfElements);
}

class GetUserAndHisNewsAction {
  final User _user;
  final List<Post> _news;
  final int _numberOfElements;

  User get user => _user;
  List<Post> get news => _news;
  int get numberOfElements => _numberOfElements;

  GetUserAndHisNewsAction(this._user, this._news, this._numberOfElements);
}
