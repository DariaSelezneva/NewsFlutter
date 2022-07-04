import 'package:news_app/redux/actions/user_actions.dart';
import 'package:news_app/redux/actions/auth_actions.dart';
import 'package:news_app/redux/actions/post_actions.dart';
import 'package:news_app/redux/reducers/auth_actions_reducer.dart';
import 'package:news_app/redux/reducers/news_reducer.dart';
import 'package:news_app/redux/reducers/post_actions_reducer.dart';
import 'package:news_app/redux/reducers/user_reducer.dart';
import '../app_state/app_state.dart';
import '../actions/get_news_action.dart';

AppState reducer(AppState prev, dynamic action) {

  if (action is GetNewsAction || action is LoadMoreAction) {
    return newsReducer(prev, action);
  }

  else if (action is LoginAction ||
      action is RegisterAction ||
      action is LogoutAction ||
      action is GetTokenAction) {
    return authReducer(prev, action);
  }

  else if (action is GetUserAction ||
      action is GetUserNewsAction ||
      action is GetUserAndHisNewsAction ||
      action is UpdateUserAction) {
    return userReducer(prev, action);
  }

  else if (action is CreatePostAction ||
      action is UpdatePostAction ||
      action is DeletePostAction) {
    return postActionsReducer(prev, action);
  }

  else {
    return prev;
  }
}