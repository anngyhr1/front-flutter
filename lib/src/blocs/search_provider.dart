import 'package:flutter/material.dart';
import 'package:news/src/blocs/search_bloc.dart';

class SearchProvider extends InheritedWidget {
  final SearchBloc bloc;

  SearchProvider({Key key, Widget child})
      : bloc = SearchBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SearchBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SearchProvider>()).bloc;
  }
}
