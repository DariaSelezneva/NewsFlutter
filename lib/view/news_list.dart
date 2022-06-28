import 'package:flutter/material.dart';
import 'package:news_app/View/news_card_large.dart';
import 'package:news_app/Model/post.dart';

class NewsList extends StatelessWidget {

  const NewsList({Key? key,
    required this.news,
    required this.activeTags}) : super(key: key);

  final List<Post> news;
  final List<String> activeTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return NewsCardLarge(
              post: news[index],
              activeTags: activeTags,
              onTapTag: (tag) => { print(tag) });
        },
      ),
    );
  }
}