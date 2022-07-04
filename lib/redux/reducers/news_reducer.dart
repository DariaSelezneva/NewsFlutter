import 'package:news_app/redux/app_state/screen_state.dart';
import '../app_state/app_state.dart';
import '../actions/get_news_action.dart';

AppState newsReducer(AppState prev, dynamic action) {

  if (action is GetNewsAction) {
    return AppState(
        commonState: ScreenState(
            news: action.news,
            page: 1,
            numberOfElements:
            action.numberOfElements,
            user: prev.commonState.user),
        userState: prev.userState,
        token: prev.token,
        loadingState: LoadingState.success);

  }

  else if (action is LoadMoreAction) {
    return AppState(
        commonState: ScreenState(
            news: prev.commonState.news + action.news,
            page: prev.commonState.page + 1,
            numberOfElements:
            action.numberOfElements,
            user: prev.commonState.user),
        userState: prev.userState,
        token: prev.token,
        loadingState: LoadingState.success);

  }
  else { return prev; }
}