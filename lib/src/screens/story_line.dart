import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

class Storyline extends StatelessWidget {
  Storyline(this.storyline);
  final String storyline;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return ColumnSuper(
      alignment: Alignment.topLeft,
      //  outerDistance: 18.0,
      children: [
        Text(
          storyline,
          style: textTheme.bodyText2.copyWith(
            color: Colors.black45,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
