import 'package:news_app/Model/post.dart';
import 'package:news_app/app_state/screen_state.dart';
import 'package:news_app/model/user.dart';

class AppState {

  final ScreenState commonState;
  final ScreenState userState;

  final String? token;

  AppState({
    required this.commonState,
    required this.userState,
    required this.token
  });

  AppState.initialState() :
        commonState = ScreenState.initialState(),
        userState = ScreenState.initialState(),
        token = null;
}