import 'package:flutter/material.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/View/news_list.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/profile/edit_post.dart';
import 'package:news_app/view/user_card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          UserCard(user: user, isEditable: true),
          SizedBox(height: 16,),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            height: 50,
            child: OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return EditPostSheet();
                        }
                      );
                },
                child: Text('New post')
            ),
          ),
          Expanded(
              child: NewsList(
                  news: Post.sample,
                  activeTags: ['cookies'],
                  isEditable: true
              )
            )
          ],
         ),
      )
      );
  }
}
