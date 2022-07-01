import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/user.dart';
import 'package:news_app/networking/api.dart';

abstract class UserRepositoryLogic {
  Future<User> getUser();
  Future<User> updateUser({
    required String avatar,
    required String email,
    required String name
  });
}

class UserRepository implements UserRepositoryLogic {
  Future<User> getUser() async {
    final token = await FlutterSecureStorage().read(key: 'token') as String;
    Map headers = {'Authorization' : token};
    final uri = Uri.https(Api.baseURL, Api.userInfo);
    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      'Authorization' : token});
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(jsonMap);
    return Future(() => user);
  }
  Future<User> updateUser({
    required String avatar,
    required String email,
    required String name
  }) async {
    final token = await FlutterSecureStorage().read(key: 'token') as String;
    Map data = {"avatar" : avatar, "email" : email, "name" : name, "role" : "user"};
    final body = jsonEncode(data);
    final uri = Uri.https(Api.baseURL, Api.user);
    final response = await http.put(uri, headers: {
      "Content-Type": "application/json",
      'Authorization' : token},
        body: body);
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(jsonMap);
    return Future(() => user);
  }
}