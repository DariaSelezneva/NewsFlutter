import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/View/news_list.dart';
import 'package:news_app/app_state/app_state.dart';
import 'package:news_app/middleware/user_middleware.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/view/profile/edit_post.dart';
import 'package:news_app/view/user_card.dart';
import 'package:redux/redux.dart';
import 'package:news_app/middleware/get_news_middleware.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        onInit: (store) => store.dispatch(getUserAndHisNews),
        converter: (store) => store,
        builder: (context, store) {
          final user = store.state.userState.user;
          return Scaffold(
              body: SafeArea(
                child: user == null ?
                    Container(child: Center(child: CircularProgressIndicator())) :
                    Column(children: [
                      UserCard(user: user, isEditable: true),
                      SizedBox(height: 16,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 10,
                        height: 50,
                        child: OutlinedButton(
                            child: Text('New post'),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return EditPostSheet(user: user);
                                  }
                              );
                            }
                        ),
                      ),
                      Expanded(
                          child: NewsList(
                              news: store.state.userState.news,
                              activeTags: ['cookies'],
                              isEditable: true
                          )
                      )
                    ],
                    ),
              )
          );

        });
  }
}
