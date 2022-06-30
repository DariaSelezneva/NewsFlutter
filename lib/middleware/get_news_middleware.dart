import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:news_app/actions/get_news_action.dart';
import 'package:news_app/app_state.dart';
import 'package:news_app/Networking/news_repository.dart';

ThunkAction<AppState> getNews = (Store<AppState> store) async {
  final repo = NewsRepository();
  await repo
      .getNews(1, 10)
      .then((response) => store.dispatch(GetNewsAction(response.content)));
};
