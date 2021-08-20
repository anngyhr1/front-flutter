import 'package:flutter/material.dart';

class FlexText extends StatelessWidget {
  @required
  final String storieText;
  @required
  final StrutStyle strutStyle;
  @required
  final TextStyle textStyle;
  FlexText(this.storieText, this.strutStyle, this.textStyle);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: RichText(
      overflow: TextOverflow.ellipsis,
      strutStyle: StrutStyle(fontSize: 10.0),
      text: TextSpan(style: textStyle, text: storieText),
    ));
  }
}
