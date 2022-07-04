import 'package:news_app/redux/actions/post_actions.dart';
import 'package:news_app/redux/app_state/screen_state.dart';
import '../app_state/app_state.dart';

AppState postActionsReducer(AppState prev, dynamic action) {

  if (action is CreatePostAction) {
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
  }

  else if (action is UpdatePostAction) {
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
  }

  else if (action is DeletePostAction) {
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
  else { return prev; }
}
