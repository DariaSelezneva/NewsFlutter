import 'package:flutter/material.dart';
import 'package:news_app/post.dart';

class NewsCardLarge extends StatelessWidget {
  const NewsCardLarge({Key? key, required this.post}) : super(key: key);

  final Post post;

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
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text(post.description, style: const TextStyle(fontSize: 14.0)),
          Container(
              height: 30,
              margin: EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                    onPressed: _onUserNamePressed, child: Text(post.username)),
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: post.tags.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('#' + post.tags[index]));
                  },
                )
              ])),
        ],
      ),
    );
  }
}
