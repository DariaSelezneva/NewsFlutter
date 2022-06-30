import 'app_state.dart';
import 'actions/get_news_action.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is GetNewsAction) {
    return AppState(action.news, null);
  } else {
    return prev;
  }
}