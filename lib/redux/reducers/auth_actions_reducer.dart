import 'package:news_app/redux/actions/auth_actions.dart';
import 'package:news_app/redux/app_state/screen_state.dart';
import '../app_state/app_state.dart';

AppState authReducer(AppState prev, dynamic action) {

  if (action is LoginAction || action is RegisterAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: action.token,
        loadingState: LoadingState.success);
  }

  else if (action is LogoutAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: null),
        token: null,
        loadingState: LoadingState.success);
  }

  else if (action is GetTokenAction) {
    return AppState(
        commonState: prev.commonState,
        userState: prev.userState,
        token: action.token,
        loadingState: LoadingState.success);
  }

  else { return prev; }
}
