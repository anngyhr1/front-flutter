import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/storie_model.dart';
import 'dart:async';
import 'repository.dart';

class NewsApiProvider implements Source {
  Future<List<StorieModel>> fetchStoriesLazy(
      String query, int page, String index) async {
    List<StorieModel> storiesList = [];
    print("NewsApiProvider, current page : " + page.toString());
    final Map<String, String> params = {
      'q': query,
      'page': page.toString(),
      'index': index
    };

    var uri = Uri.parse('http://localhost:5000/search');
    uri = uri.replace(queryParameters: params);
    print(uri);

    final response = await http.get(uri);
    final parsedJson = json.decode(response.body);
    print("parsedJson " + parsedJson.toString());

    if (parsedJson["data"] != null)
      parsedJson["data"]
          .forEach((x) => storiesList.add(StorieModel.fromJson(x)));

    // parsedJson["data"].map((x) => StorieModel.fromJson(x));
    return storiesList;
  }
}
