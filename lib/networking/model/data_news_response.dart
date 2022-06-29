import 'dart:core';
import 'package:news_app/Model/post.dart';

class DataNewsResponse {

  List<Post> content;
  int numberOfElements;

  DataNewsResponse({
    required this.content,
    required this.numberOfElements});

  factory DataNewsResponse.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as List;
    final posts = content.map((e) => Post.fromJson(e)).toList();
    return DataNewsResponse(content: posts, numberOfElements: json['numberOfElements'] as int);
  }
}