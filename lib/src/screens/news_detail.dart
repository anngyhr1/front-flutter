import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import '../models/storie_model.dart';

class NewsDetail extends StatelessWidget {
  //final int itemId;

  //NewsDetail({this.itemId});
  NewsDetail();

  Widget build(context) {
    print('IN NewsDetail');
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.currStorieDetail,
      builder: (context, AsyncSnapshot<StorieModel> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading');
        }
        print('buildBody snapshot ' + snapshot.data.title);

        return buildList(snapshot.data);
      },
    );
  }

  Widget buildList(StorieModel item) {
    print('IN buildList');
    final children = <Widget>[];
    children.add(buildTitle(item));
    return ListView(
      children: children,
    );
  }

  Widget buildTitle(StorieModel item) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
