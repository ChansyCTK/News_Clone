import 'dart:convert';

import 'package:news_clone/api/api_url.dart';
import 'package:news_clone/models/models.dart';
import 'package:http/http.dart' as http;

class Api_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var models = null;

    try {
      var respone = await client.get(Strings.api_url);
      if (respone.statusCode == 200) {
        var jsonString = respone.body;
        var jsonMap = json.decode(jsonString);

        models = NewsModel.fromJson(jsonMap);
      }
    } catch (Execption) {
      return models;
    }
    return models;
  }
}
