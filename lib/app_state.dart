import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';

class AppState {

  final List<Post> news;
  final int page;
  final int numberOfElements;

  final User? user;
  final String? token;

  // List<Post> get news => _news;
  // int get page => _page;
  // int get numberOfElements => _numberOfElements;
  // User? get user => _user;
  // String? get token => _token;

  AppState({
    required this.news,
    required this.page,
    required this.numberOfElements,
    required this.user,
    required this.token});

  AppState.initialState() :
        news = [],
        page = 1,
        numberOfElements = 0,
        user = null,
        token = null;
}