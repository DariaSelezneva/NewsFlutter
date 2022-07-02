import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<DataNewsResponse> getUserNews(String userId);
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

  Future<DataNewsResponse> getUserNews(String userId) async {
    final token = await FlutterSecureStorage().read(key: 'token') as String;
    Map<String, String> queryParameters = {
      'page': '1',
      'perPage': '10'
    };
    final uri = Uri.https(Api.baseURL, Api.userNews + userId, queryParameters);
    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      'Authorization' : token});
    final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonMap);
    final data = DataNewsResponse.fromJson(jsonMap);
    return Future(() => data);
  }
}