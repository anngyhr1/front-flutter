import 'package:flutter/material.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/widgets/navigation_drawer_widget.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';
import '../widgets/refresh.dart';
import '../widgets/loading_container.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Top Stories'),
      ),
      body: buildList(bloc),
      // bottomNavigationBar: NavBar(),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.storieList,
      builder: (context, AsyncSnapshot<List<StorieModel>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            controller: bloc.scrollController,
            itemBuilder: (context, int index) {
              print('snapshot.data[index] :' + snapshot.data[index].toString());

              return NewsListTile(
                storie: snapshot.data[index],
              );
            },
          ),
        );
      },
    );
  }
}
