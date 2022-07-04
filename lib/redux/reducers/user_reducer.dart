import 'package:news_app/redux/actions/user_actions.dart';
import 'package:news_app/redux/app_state/screen_state.dart';
import '../app_state/app_state.dart';
import '../actions/get_news_action.dart';

AppState userReducer(AppState prev, dynamic action) {

  if (action is GetUserAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);
  }

  else if (action is GetUserNewsAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: action.news,
            page: 1,
            numberOfElements: action.numberOfElements,
            user: prev.userState.user),
        token: prev.token,
        loadingState: LoadingState.success);
  }

  else if (action is GetUserAndHisNewsAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: action.news,
            page: 1,
            numberOfElements: action.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);
  }

  else if (action is UpdateUserAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);
  }

  else {
    return prev;
  }
}
