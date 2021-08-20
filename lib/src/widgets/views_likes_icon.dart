import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewsLikesIcon extends StatelessWidget {
  @required
  final int rating;

  ViewsLikesIcon(this.rating);

  @override
  Widget build(BuildContext context) {
    return RowSuper(
      innerDistance: 4.0,
      outerDistance: 4.0,
      children: [
        Icon(Icons.favorite, color: Colors.black87, size: 13.0),
        Text(
          formatRating(rating),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
        Padding(padding: Pad(left: 2)),
        Icon(Icons.visibility, color: Colors.black87, size: 13.0),
        Text(formatRating(rating),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, color: Colors.black87))
      ],
    );
  }

  String formatRating(int rating) {
    var formatter = NumberFormat.compact();
    return formatter.format(rating);
  }
}
