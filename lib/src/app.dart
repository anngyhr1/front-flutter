import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'blocs/stories_provider.dart';
import 'screens/news_detail.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    print('entro a routes');
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          final storiesBloc = StoriesProvider.of(context);
          print('App storiesBloc.setHasMore(true);');
          storiesBloc.setHasMore(true);
          storiesBloc.loadMore();

          return NewsList();
        },
      );
    } else {
      print('settings.name != /');
      return MaterialPageRoute(
        builder: (context) {
          print('IN MaterialPageRoute settings.name ' + settings.name);
          print('IN MaterialPageRoute settings.name.replaceFirst(/, ) ' +
              settings.name.replaceFirst('/', ''));

          return NewsDetail();
        },
      );
    }
  }
}
