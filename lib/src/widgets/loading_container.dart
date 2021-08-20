import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  build(context) {
    return ListView.builder(
      itemCount: new List<int>.generate(10, (i) => i + 1).length,
      itemBuilder: (context, int index) {
        return Column(
          children: [
            ListTile(
              title: buildContainer(),
              subtitle: buildContainer(),
            ),
            Divider(height: 8.0),
          ],
        );
      },
    );
  }

  Widget buildContainer() {
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }
}
