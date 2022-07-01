// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news_app/View/news_list.dart';
import 'package:news_app/Model/post.dart';
import 'package:news_app/middleware/user_middleware.dart';
import 'package:news_app/networking/model/data_news_response.dart';
import 'package:news_app/Networking/news_repository.dart';
import 'package:news_app/view/profile/profile_screen.dart';
import 'package:news_app/middleware/get_news_middleware.dart';
import 'package:news_app/app_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    StoreConnector<AppState, AppState>(
        onInit: (store) => store.dispatch(getNews),
        converter: (store) => store.state,
        builder: (context, state) {
          return NewsList(
              news: state.news,
              activeTags: ['cookies'],
              isEditable: false);
        }),
    StoreConnector<AppState, AppState>(
        onInit: (store) => store.dispatch(getToken),
        converter: (store) => store.state,
        builder: (context, state) {
          return ProfileScreen(token: state.token);
        })

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.line_weight), label: 'News'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
