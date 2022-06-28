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
  
  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final avatar = json['avatar'] as String;
    final email = json['email'] as String;
    final name = json['name'] as String;
    return User(id: id, avatar: avatar, email: email, name: name);
  }
}