import 'package:flutter/material.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/View/tags_list.dart';
import 'package:news_app/view/profile/edit_post.dart';

class NewsCardLarge extends StatelessWidget {
  const NewsCardLarge({Key? key,
    required this.post,
    required this.activeTags,
    required this.isEditable,
    required this.onTapTag
    }) : super(key: key);

  final Post post;
  final List<String> activeTags;
  final bool isEditable;
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
                  const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  )
          ),
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
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),
                    SizedBox(width: 12),
                    TagsList(tags: post.tags,
                      activeTags: activeTags,
                      onTapTag: onTapTag
                    ),
                    if (isEditable) IconButton(onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return EditPostSheet(post: post);
                          }
                      );
                    },
                        icon: const Icon(Icons.edit))
                  ] // Row children
              )
          ),
        ],  // Column children
      ),
    );
  }
}
