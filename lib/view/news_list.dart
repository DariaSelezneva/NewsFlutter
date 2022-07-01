import 'package:flutter/material.dart';
import 'package:news_app/View/news_card_large.dart';
import 'package:news_app/Model/post.dart';

class NewsList extends StatefulWidget {

  const NewsList({Key? key,
    required this.news,
    required this.activeTags,
    required this.isEditable }) : super(key: key);

  final List<Post> news;
  final List<String> activeTags;
  final bool isEditable;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {

  var scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.news.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsCardLarge(
            post: widget.news[index],
            activeTags: widget.activeTags,
            isEditable: widget.isEditable,
            onTapTag: (tag) => { print(tag) });
      },
    );
  }

//   @override
//   void initState() {
//     scrollController.addListener(pagination);
//     super.initState();
//   }
//
// //_subCategoryModel only use for check the length of product
//   void pagination() {
//     if ((scrollController.position.pixels ==
//         scrollController.position.maxScrollExtent) && (_subCategoryModel.products.length < total)) {
//       setState(() {
//         isLoading = true;
//         page += 1;
//         //add api for load the more data according to new page
//       });
//     }
//   }
}