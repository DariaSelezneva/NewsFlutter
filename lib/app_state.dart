import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';

class AppState {

  final List<Post> _news;
  final User? _user;

  List<Post> get news => _news;
  User? get user => _user;

  AppState(this._news, this._user);

  AppState.initialState() : _news = [], _user = null;

}