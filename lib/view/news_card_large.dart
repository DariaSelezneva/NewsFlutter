import 'package:flutter/material.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/View/tags_list.dart';

class NewsCardLarge extends StatelessWidget {
  const NewsCardLarge({Key? key,
    required this.post,
    required this.activeTags,
    required this.onTapTag}) : super(key: key);

  final Post post;
  final List<String> activeTags;
  final Function(String tag) onTapTag;

  void _onUserNamePressed() {
    print('pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // SizedBox(height: 200, width: double.infinity, child: Image.network(post.image)),
          Image.network(post.image,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth),
          const SizedBox(height: 10.0),
          Text(post.title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text(post.description, style: const TextStyle(fontSize: 14.0)),
          Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: _onUserNamePressed,
                        child: Text('@' + post.username),
                        style: ButtonStyle(textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),),
                    SizedBox(width: 12),
                    TagsList(tags: post.tags,
                      activeTags: activeTags,
                      onTapTag: onTapTag )
                  ] // Row children
              )
          ),
        ],  // Column children
      ),
    );
  }
}
