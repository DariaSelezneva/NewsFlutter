import 'package:news_app/model/user.dart';

class GetTokenAction {
  final String? _token;
  String? get token => _token;
  GetTokenAction(this._token);
}

class _AuthAction {

  final User _user;
  final String? _token;

  User get user => _user;
  String? get token => _token;

  _AuthAction(this._user, this._token);

}

class LoginAction extends _AuthAction {
  LoginAction(_user, _token) : super(_user, _token);
}

class RegisterAction extends _AuthAction {
  RegisterAction(_user, _token) : super(_user, _token);
}

class LogoutAction {}