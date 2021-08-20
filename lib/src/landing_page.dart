import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storiesBloc = StoriesProvider.of(context);
    print('App storiesBloc.setHasMore(true);');
    storiesBloc.setHasMore(true);
    storiesBloc.loadMore();
    return HomePage();
  }
}
