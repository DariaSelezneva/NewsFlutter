import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/post.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/api.dart';
import 'package:news_app/networking/model/data_news_response.dart';

abstract class UserRepositoryLogic {
  Future<User> getUser();
  Future<User> updateUser(
      String avatar,
      String email,
      String name
  );
}

class UserRepository implements UserRepositoryLogic {

  Future<User> getUser() async {
    final token = await FlutterSecureStorage().read(key: 'token') as String;
    final uri = Uri.https(Api.baseURL, Api.userInfo);
    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      'Authorization' : token});
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonData = jsonMap['data'] as Map<String, dynamic>;
    final user = User.fromJson(jsonData);
    return Future(() => user);
  }

  Future<User> updateUser(
      String avatar,
      String email,
      String name) async {
    final token = await FlutterSecureStorage().read(key: 'token') as String;
    Map data = {"avatar" : avatar, "email" : email, "name" : name, "role" : "user"};
    final body = jsonEncode(data);
    final uri = Uri.https(Api.baseURL, Api.user);
    final response = await http.put(uri, headers: {
      "Content-Type": "application/json",
      'Authorization' : token},
        body: body);
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonData = jsonMap['data'] as Map<String, dynamic>;
    final user = User.fromJson(jsonData);
    return Future(() => user);
  }
}