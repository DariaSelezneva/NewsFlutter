import 'package:news_app/actions/user_actions.dart';

import 'app_state.dart';
import 'actions/get_news_action.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is GetNewsAction) {
    return AppState(
        news: action.news,
        page: 1,
        numberOfElements:
        action.numberOfElements,
        user: prev.user,
        token: prev.token);
  } else if (action is LoadMoreAction) {
    return AppState(
        news: prev.news + action.news,
        page: prev.page + 1,
        numberOfElements:
        action.numberOfElements,
        user: prev.user,
        token: prev.token);
  } else if (action is GetTokenAction) {
    return AppState(
        news: prev.news,
        page: prev.page,
        numberOfElements:
        prev.numberOfElements,
        user: prev.user,
        token: action.token);
  }
  else {
    return prev;
  }
}