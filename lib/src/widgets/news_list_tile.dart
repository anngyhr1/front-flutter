import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/screens/storie_details_page.dart';
import 'package:news/src/widgets/avatar_widget.dart';
import 'package:news/src/widgets/flex_text.dart';
import 'package:news/src/widgets/header_picture.dart';
import 'package:news/src/widgets/storie_info.dart';
import 'package:overflow_view/overflow_view.dart';
import '../blocs/stories_provider.dart';
import 'loading_container.dart';
//import 'package:intl/intl.dart';

class NewsListTile extends StatelessWidget {
  final StorieModel storie;

  NewsListTile({this.storie});

  Widget build(context) {
    return buildTile(context, storie);
  }

  Widget buildTile(BuildContext context, StorieModel storie) {
    var textTheme = Theme.of(context).textTheme;
    final bloc = StoriesProvider.of(context);
    return InkWell(
      onTap: () {
        bloc.setCurrStorieDetail(storie);
        StorieDetailsPage.show(context, storie);
      },
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: HeaderPicture('images/banner.png'),
            ),
            Expanded(
              flex: 7,
              child: StorieInfo(storie, textTheme),
            ),
          ],
        ),
        Divider(height: 8.0),
      ]),
    );
  }
}
