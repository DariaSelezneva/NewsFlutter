import 'package:news_app/Model/post.dart';

class GetNewsAction {

  final List<Post> _news;
  final int _numberOfElements;

  List<Post> get news => _news;
  int get numberOfElements => _numberOfElements;

  GetNewsAction(this._news, this._numberOfElements);

}

class LoadMoreAction {

  final List<Post> _news;
  final int _numberOfElements;

  List<Post> get news => _news;
  int get numberOfElements => _numberOfElements;

  LoadMoreAction(this._news, this._numberOfElements);

}