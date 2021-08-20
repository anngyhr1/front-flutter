import 'package:flutter/material.dart';
import 'package:news/src/models/storie_model.dart';

class RatingInformation extends StatelessWidget {
  RatingInformation(this.storie);
  final StorieModel storie;

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];
    var star = Icon(
      Icons.star,
      color: theme.accentColor,
    );
    stars.add(star);

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var numericRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          storie.rate.toString(),
          style: textTheme.headline6.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
      ],
    );

    var starRating = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        starRating,
        SizedBox(width: 8.0),
        numericRating,
      ],
    );
  }
}
