import 'package:news_app/Model/post.dart';
import 'package:news_app/app_state/screen_state.dart';
import 'package:news_app/model/user.dart';

enum LoadingState { success, loading, error }

class AppState {

  final ScreenState commonState;
  final ScreenState userState;

  final String? token;

  final LoadingState loadingState;
  final String? error;

  AppState({
    required this.commonState,
    required this.userState,
    required this.token,
    required this.loadingState,
    this.error
  });

  AppState.initialState() :
        commonState = ScreenState.initialState(),
        userState = ScreenState.initialState(),
        token = null,
        loadingState = LoadingState.loading,
        error = null;
}