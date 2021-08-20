import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/widgets/avatar_widget.dart';
import 'package:news/src/widgets/flex_text.dart';
import 'package:news/src/widgets/views_likes_icon.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

class StorieInfo extends StatelessWidget {
  @required
  final StorieModel storie;
  @required
  final TextTheme textTheme;

  StorieInfo(this.storie, this.textTheme);

  Widget build(context) {
    return ColumnSuper(
      innerDistance: 4.0,
      outerDistance: 4.0,
      alignment: Alignment.topLeft,
      children: [
        Row(children: [
          FlexText(
              storie.title,
              StrutStyle(fontSize: 10.0),
              TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
        ]),
        ViewsLikesIcon(storie.rate.floor()),
        Row(children: [
          FlexText(storie.text, StrutStyle(fontSize: 10.0),
              TextStyle(color: Colors.black87, fontSize: 12)),
        ]),
        //Row(children: _buildCategoryChips(storie, textTheme))
        OverflowView(
          direction: Axis.horizontal,
          spacing: 4,
          children: _buildCategoryChips(storie, textTheme),
          builder: (context, remaining) {
            return AvatarWidget(
              text: '+$remaining',
              color: Colors.black12,
            );
          },
        )
      ],
    );
  }

  List<Widget> _buildCategoryChips(StorieModel storie, TextTheme textTheme) {
    return storie.categories.map((category) {
      return Container(
          child: Text(category,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold)),
          padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black45),
              borderRadius: const BorderRadius.all(Radius.circular(8))));
    }).toList();
  }
}
