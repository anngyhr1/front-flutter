import 'package:flutter/material.dart';
import 'package:news/src/models/storie_model.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        // await bloc.clearCache();
        //await bloc.setStorieList(<StorieModel>[]);
        //await bloc.clearCache();
        await bloc.setPageNumber(0);
        await bloc.setHasMore(true);
        //await bloc.clearCache();
        // bloc.setStorieList(null);
        await bloc.loadMore();
      },
    );
  }
}
