import 'dart:core';
import 'package:news_app/Model/post.dart';

class DataNewsResponse {

  List<Post> content;
  int numberOfElements;

  DataNewsResponse({
    required this.content,
    required this.numberOfElements});

}