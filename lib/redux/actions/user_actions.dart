import 'package:news_app/model/user.dart';

class _UserAction {
  final User _user;
  User get user => _user;
  _UserAction(this._user);
}
class GetUserAction extends _UserAction {
  GetUserAction(_user) : super(_user);
}

class UpdateUserAction extends _UserAction {
  UpdateUserAction(_user) : super(_user);
}

class GetUserInfoByIdAction extends _UserAction {
  GetUserInfoByIdAction(_user) : super(_user);
}