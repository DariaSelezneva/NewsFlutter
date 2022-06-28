import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';

class UserCard extends StatelessWidget {

  const UserCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.network(user.avatar)
      ],),
    );
  }
}