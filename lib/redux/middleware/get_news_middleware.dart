import 'package:news_app/networking/user_repository.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:news_app/redux/actions/get_news_action.dart';
import 'package:news_app/redux/app_state/app_state.dart';
import 'package:news_app/Networking/news_repository.dart';

ThunkAction<AppState> getNews = (Store<AppState> store) async {
  await NewsRepository()
      .getNews(1)
      .then((response) => store.dispatch(GetNewsAction(response.content, response.numberOfElements)));
};

ThunkAction<AppState> loadMore = (Store<AppState> store) async {
  await NewsRepository()
      .getNews(2)
      .then((response) => store.dispatch(GetNewsAction(response.content, response.numberOfElements)));
};

void getUserNews(Store<AppState> store, String userId) async {
  await NewsRepository()
      .getUserNews(userId)
      .then((response) => store.dispatch(GetUserNewsAction(response.content, response.numberOfElements)));
}

ThunkAction<AppState> getUserAndHisNews = (Store<AppState> store) async {
  await UserRepository().getUser()
    .then((user) {
      NewsRepository()
          .getUserNews(user.id)
          .then((response) => store.dispatch(GetUserAndHisNewsAction(user, response.content, response.numberOfElements)));
    });
};

