import 'dart:core';

class User {
  
  String id;
  String avatar;
  String email;
  String name;
  String role = 'user';
  
  User({
    required this.id,
    required this.avatar,
    required this.email,
    required this.name
  });

  static User sample = User(
      id: "23817669-18cc-4402-9707-7a49f93cbe25",
      avatar: "https://news-feed.dunice-testing.com/api/v1/file/693d86bf-fedd-47e8-8f00-332780ab46b8.",
      email: "bla@bla.com",
      name: "Blabla");

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final avatar = json['avatar'] as String;
    final email = json['email'] as String;
    final name = json['name'] as String;
    return User(id: id, avatar: avatar, email: email, name: name);
  }
}