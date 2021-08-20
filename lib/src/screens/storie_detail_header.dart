import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/screens/arc_banner_image.dart';
import 'package:news/src/widgets/views_likes_icon.dart';

class StorieDetailHeader extends StatelessWidget {
  StorieDetailHeader(this.storie);
  final StorieModel storie;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = ColumnSuper(
      alignment: Alignment.center,
      innerDistance: 8.0,
      outerDistance: 8.0,
      children: [
        Text(
          storie.title,
          style: textTheme.headline6,
        ),
        ViewsLikesIcon(storie.rate.round()),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: ArcBannerImage('images/banner.png'),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return storie.categories.map((category) {
      return Chip(
        label: Text(category),
        labelStyle: textTheme.caption,
        backgroundColor: Colors.black12,
      );
    }).toList();
  }
}
