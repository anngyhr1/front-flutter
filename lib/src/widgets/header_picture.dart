import 'package:flutter/material.dart';

class HeaderPicture extends StatelessWidget {
  final String portadaUrl;

  HeaderPicture(this.portadaUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            portadaUrl,
            fit: BoxFit.fitHeight,
            //  width: 10,
            // height: 80,
          ),
        ),
      ),
    );
  }
}
