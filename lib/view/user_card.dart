import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';

class UserCard extends StatelessWidget {

  const UserCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(children: [
        CircleAvatar(child: Image.network(user.avatar)),
        Column(children: [
          Text(user.name),
          Text(user.email)
        ]),
        IconButton(onPressed: () => (print('')), icon: const Icon(Icons.close))
      ],),
    );
  }
}