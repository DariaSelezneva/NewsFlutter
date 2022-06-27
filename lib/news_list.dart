import 'package:flutter/material.dart';
import 'package:news_app/news_card_large.dart';
import 'package:news_app/post.dart';

class NewsList extends StatelessWidget {

  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<Post> news;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return NewsCardLarge(post: news[index]);
        },
      ),
    );
  }
}