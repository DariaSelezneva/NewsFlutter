import 'package:flutter/material.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    NewsList(news: Post.sample),
    Container(color: Colors.green)
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
        items: <BottomNavigationBarItem> [
          const BottomNavigationBarItem(icon: Icon(Icons.line_weight), label: 'News'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
  
}
