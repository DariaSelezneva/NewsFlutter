import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'redux/reducers/reducer.dart';
import 'View/home.dart';
import 'redux/app_state/app_state.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {

  NewsApp({Key? key}) : super(key: key);

  final store = Store<AppState>(reducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home()
      ),
    );
  }
}
