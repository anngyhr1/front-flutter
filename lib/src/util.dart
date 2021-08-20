import 'dart:convert';

import 'package:news/src/blocs/search_bloc.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<StorieModel>> getHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getStringList('history_queue') != null &&
      prefs.getStringList('history_queue').isNotEmpty) {
    return prefs
        .getStringList('history_queue')
        .map((storie) => StorieModel.fromJson(jsonDecode(storie)))
        .toList()
        .reversed
        .toList();
  }
  return Future.value(List.empty());
}

addHistories(StorieModel storie) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList('history_queue') != null) {
    try {
      List<String> histjson = prefs.getStringList('history_queue');
      if (histjson.length >= 6) {
        histjson.removeAt(0);
      }
      histjson.add(jsonEncode(storie));

      await prefs.setStringList('history_queue', histjson);
    } catch (e) {
      print("error accediendo al shared preferences " + e.toString());
    }
  } else {
    try {
      List<String> history = [];
      history.add(jsonEncode(storie.toJson()));
      await prefs.setStringList('history_queue', history);
    } catch (e) {
      print("error accediendo al shared preferences " + e.toString());
    }
  }
}

setBrowserHistory(SearchBloc searchBloc) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList('history_queue') != null) {
    searchBloc.setSearchHistory(prefs.getStringList('history_queue'));
  }
}
