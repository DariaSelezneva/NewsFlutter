import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/networking/api.dart';
import 'package:news_app/networking/model/auth_response.dart';

abstract class LoginRepositoryLogic {
  Future<AuthResponse> login({required String email, required String password});
}

class LoginRepository implements LoginRepositoryLogic {
  Future<AuthResponse> login({required String email, required String password}) async {
    Map data = {
      'email': email,
      'password' : password
    };
    //encode Map to JSON
    final body = jsonEncode(data);
    final uri = Uri.https(Api.baseURL, Api.login);
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