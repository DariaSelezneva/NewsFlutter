import 'package:news_app/model/user.dart';

class GetTokenAction {

  final String? _token;

  String? get token => _token;

  GetTokenAction(this._token);

}

class LoginAction {

  final User _user;
  final String? _token;

  User get user => _user;
  String? get token => _token;

  LoginAction(this._user, this._token);

}

class LogoutAction {}

class GetUserAction {

  final User _user;

  User get user => _user;

  GetUserAction(this._user);

}