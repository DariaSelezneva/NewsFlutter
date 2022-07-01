import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/networking/api.dart';
import 'package:news_app/networking/model/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class RegistrationRepositoryLogic {
  Future<AuthResponse> register({
    required String avatar,
    required String email,
    required String name,
    required String password});
}

class RegisterRepository implements RegistrationRepositoryLogic {

  Future<AuthResponse> register({
    required String avatar,
    required String email,
    required String name,
    required String password}) async {

    Map data = {
      'avatar': avatar,
      'email': email,
      'name': name,
      'password' : password,
      'role' : 'user'
    };
    //encode Map to JSON
    final body = jsonEncode(data);
    final uri = Uri.https(Api.baseURL, Api.register);
    final response = await http.post(uri,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final authResponse = AuthResponse.fromJson(jsonMap);
    await FlutterSecureStorage().write(key: 'token', value: authResponse.token);
    return Future(() => authResponse);
  }
}