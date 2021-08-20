import 'dart:async';
import 'news_api_provider.dart';
import '../models/storie_model.dart';

class Repository {
  List<Source> sources = <Source>[
    NewsApiProvider(),
  ];

  Future<List<StorieModel>> fetchStoriesLazy(
      String query, int page, String index) {
    return sources[0].fetchStoriesLazy(query, page, index);
  }
}

abstract class Source {
  Future<List<StorieModel>> fetchStoriesLazy(
      String query, int page, String index);
}
