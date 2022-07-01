import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:news_app/networking/api.dart';

abstract class UploadRepositoryLogic {
  Future<String> upload({required File image});
}

class UploadRepository implements UploadRepositoryLogic {
  Future<String> upload({required File image}) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    final uri = Uri.https(Api.baseURL, Api.uploadFile);
    final bytes = await image.readAsBytes();
    final id = Random().nextInt(10000).toString();
    var request = http.MultipartRequest('POST', uri)
    ..headers.addAll(headers)
    ..files.add(http.MultipartFile.fromBytes('file', bytes, contentType: MediaType('image', 'jpg'), filename: 'avatar' + id));
    var response = await request.send();
    final streamResponse = await http.Response.fromStream(response);
    final jsonMap = jsonDecode(streamResponse.body) as Map<String, dynamic>;
    final url = jsonMap['data'] as String;
    return Future(() => url);
  }
}