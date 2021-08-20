import 'package:news/src/models/storie_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../util.dart';

class SearchBloc {
  final _searchHistory = BehaviorSubject<List<String>>();
  final _repository = Repository();
  String _query = '';
  String get query => _query;
  List<StorieModel> _suggestions;

  Observable<List<String>> get getSearchHistory => _searchHistory.stream;
  List<StorieModel> get suggestions => _suggestions;
  Function(List<String>) get setSearchHistory => _searchHistory.sink.add;

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _query = query;

    if (query.isEmpty) {
      _suggestions = await getHistory();
    } else {
      List<StorieModel> storieList =
          await _repository.fetchStoriesLazy(query, 0, "stories");

      _suggestions = storieList;
    }
  }

  dispose() {
    _searchHistory.close();
  }
}
