import 'package:news_app/actions/user_actions.dart';
import 'package:news_app/app_state/screen_state.dart';

import 'app_state/app_state.dart';
import 'actions/get_news_action.dart';

AppState reducer(AppState prev, dynamic action) {
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

  } else if (action is LoadMoreAction) {
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

  } else if (action is GetTokenAction) {
    return AppState(
        commonState: prev.commonState,
        userState: prev.userState,
        token: action.token,
        loadingState: LoadingState.success);

  } else if (action is LoginAction || action is RegisterAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: action.token,
        loadingState: LoadingState.success);

  } else if (action is LogoutAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: null),
        token: null,
        loadingState: LoadingState.success);

  } else if (action is GetUserAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is GetUserNewsAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: action.news,
            page: 1,
            numberOfElements: action.numberOfElements,
            user: prev.userState.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is GetUserAndHisNewsAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: action.news,
            page: 1,
            numberOfElements: action.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is UpdateUserAction) {
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: prev.userState.news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: action.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is CreatePostAction) {
    var news = prev.userState.news;
    news.insert(0, action.post);
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements + 1,
            user: prev.userState.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is UpdatePostAction) {
    var news = prev.userState.news;
    final index = news.indexWhere((element) => element.id == action.post.id);
    news.removeAt(index);
    news.insert(index, action.post);
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements,
            user: prev.userState.user),
        token: prev.token,
        loadingState: LoadingState.success);

  } else if (action is DeletePostAction) {
    var news = prev.userState.news;
    final index = news.indexWhere((element) => element.id == action.postId);
    news.removeAt(index);
    return AppState(
        commonState: prev.commonState,
        userState: ScreenState(
            news: news,
            page: prev.userState.page,
            numberOfElements: prev.userState.numberOfElements - 1,
            user: prev.userState.user),
        token: prev.token,
        loadingState: LoadingState.success);
  }
  else {
    return prev;
  }
}