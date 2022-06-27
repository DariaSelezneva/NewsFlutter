import 'dart:core';

class Api {

  // Strings
  static const _baseURL = 'https://news-feed.dunice-testing.com/api/v1';
  static const _auth = '/auth';
  static const _login = '/login';
  static const _register = '/register';

  static const _file = '/file';
  static const _uploadFile = '/uploadFile';

  static const _news = '/news';
  static const _find = '/find';
  static const _user = '/user';

  static const _info = '/info';

  // URLs

  static const loginURL = _baseURL + _auth + _login;
  static const registerURL = _baseURL + _auth + _register;

  static const uploadFileURL = _baseURL + _file + _uploadFile;

  static const newsURL = _baseURL + _news;
  static const findNewsURL = _baseURL + _news + _find;

  static const userURL = _baseURL + _user;
  static const getUserInfoURL = _baseURL + _user + _info;

}