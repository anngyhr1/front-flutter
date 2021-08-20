import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:news/src/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchModel extends ChangeNotifier {
  final _repository = Repository();
  bool _isLoading = false;
  List<StorieModel> _suggestions = [];
  String _query = '';

  bool get isLoading => _isLoading;
  List<StorieModel> get suggestions => _suggestions;
  String get query => _query;

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _query = query;
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
    } else {
      List<StorieModel> storieList =
          await _repository.fetchStoriesLazy(query, 0, "stories");

      _suggestions = storieList;
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() async {
    _suggestions = await getHistory();
    notifyListeners();
  }
}
