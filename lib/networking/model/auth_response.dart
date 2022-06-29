import 'dart:core';

class AuthResponse {

  String id;
  String avatar;
  String email;
  String name;
  String role;
  String token;

  AuthResponse({
    required this.id,
    required this.avatar,
    required this.email,
    required this.name,
    required this.role,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    final id = data['id'] as String;
    final avatar = data['avatar'] as String;
    final email = data['email'] as String;
    final name = data['name'] as String;
    final role = data['role'] as String;
    final token = data['token'] as String;
    return AuthResponse(id: id, avatar: avatar, email: email, name: name, role: role, token: token);
  }
}