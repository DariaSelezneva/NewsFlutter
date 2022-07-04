import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';

class ScreenState {
  final List<Post> news;
  final int page;
  final int numberOfElements;
  final List<String> activeTags = [];

  final User? user;

  // List<Post> get news => _news;
  // int get page => _page;
  // int get numberOfElements => _numberOfElements;
  // User? get user => _user;

  ScreenState({
    required this.news,
    required this.page,
    required this.numberOfElements,
    required this.user});

  ScreenState.initialState() :
        news = [],
        page = 1,
        numberOfElements = 0,
        user = null;
}