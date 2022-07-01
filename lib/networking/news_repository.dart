import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/networking/api.dart';
import 'package:news_app/networking/model/data_news_response.dart';
import 'package:news_app/Model/post.dart';


abstract class NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
      [
        String? keywords,
        String? author,
        List<String>? tags
      ]);
}

class NewsRepository implements NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
      [
        String? keywords,
        String? author,
        List<String>? tags
      ]) async {

    Map<String, String> queryParameters = {
      'page': page.toString(),
      'perPage': '10'
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
    final uri = Uri.https(Api.baseURL, Api.news, queryParameters);
    final response = await http.get(uri);
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    final data = DataNewsResponse.fromJson(jsonMap);
    return Future(() => data);
  }
}

class NewsRepositoryMock implements NewsRepositoryLogic {
  Future<DataNewsResponse> getNews(
      int page,
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