import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  // final String title;
  final Widget child;

  Content({
    Key key,
    //  @required this.title,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(fit: FlexFit.loose, child: child),
      ],
    );
    // );
  }
}
