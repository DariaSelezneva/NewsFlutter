import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/Networking/api.dart';
import 'package:news_app/Networking/Model/data_news_response.dart';
import 'package:news_app/Model/post.dart';


abstract class NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
      int perPage,
      [
        String? keywords,
        String? author,
        List<String>? tags
      ]);
}

class NewsRepository implements NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
      int perPage,
      [
        String? keywords,
        String? author,
        List<String>? tags
      ]) async {
    Map<String, String> queryParameters = {
      'page': page.toString(),
      'perPage': perPage.toString()
    };
    if (keywords != null) {
      queryParameters['keywords'] = keywords;
    }
    if (author != null) {
      queryParameters['author'] = author;
    }
    if (tags != null && tags.isNotEmpty) {
      queryParameters['tags'] = tags.join(',');
    }
    final uri = Uri.https(Api.newsURL, '', queryParameters);
    final response = await http.get(uri);
    final jsonMap = jsonDecode(response.body);
    print(jsonMap);
    return Future<DataNewsResponse>.delayed(
        Duration(seconds: 1),
            () => DataNewsResponse(
            content: Post.sample,
            numberOfElements: Post.sample.length
        )
    );
  }
}

class NewsRepositoryMock implements NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
      int perPage,
      [
        String? keywords,
        String? author,
        List<String>? tags
      ]) {
    return Future<DataNewsResponse>.delayed(
        Duration(seconds: 1),
            () => DataNewsResponse(
                content: Post.sample,
                numberOfElements: Post.sample.length
            )
    );
  }
}