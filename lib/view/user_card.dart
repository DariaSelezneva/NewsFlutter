import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/profile/edit_user.dart';

class UserCard extends StatelessWidget {

  const UserCard({Key? key, required this.user, required this.isEditable}) : super(key: key);

  final User user;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(children: [
        ClipOval(
            child: Image.network(
              user.avatar,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
        ),
        SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(user.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height: 10,),
          Text(user.email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal
              )
          )
        ]),
        Expanded(child: Container()),
        isEditable ? IconButton(onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return EditUserSheet(user: user);
              }
          );
        }, icon: const Icon(Icons.edit)) :
        IconButton(onPressed: () => {}, icon: const Icon(Icons.close))
      ],),
    );
  }
}