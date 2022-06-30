import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';

class GetNewsAction {

  final List<Post> _news;
  List<Post> get news => _news;

  GetNewsAction(this._news);

}
