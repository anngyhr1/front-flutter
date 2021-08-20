import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:news/src/widgets/home/constants.dart';

class CoverImage extends StatelessWidget {
  final String image;
  final List<String> images;
  final String title;
  final String subtitle;
  final bool isBig;
  final Object tag;
  final VoidCallback onClick;
  final bool isAssetImage;

  CoverImage({
    @required this.title,
    this.image,
    this.images,
    this.subtitle = '',
    this.isBig = false,
    this.tag,
    this.onClick,
    // this.focusedMenuItems,
    this.isAssetImage = false,
  }) {
    assert(image != null || images != null);
    if (images != null) {
      assert(images.length == 4);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width10 = size.shortestSide / 10;
    //var imgWidth = width10 * (isBig ? 4.1 : 3.8);
    var imgWidth = width10 * (isBig ? 3.3 : 2.5);
    var menuWidth = width10 * (isBig ? 4.7 : 4.2);

    var img = Image.asset(
      image,
      height: imgWidth,
      width: imgWidth,
      fit: BoxFit.fitHeight,
    );

    var widget = Padding(
        // padding: EdgeInsets.all(8.0),
        padding: EdgeInsets.only(right: 12.0),
        child: Container(
          width: imgWidth,
          // height: imgWidth + 3 * rem,
          // height: imgWidth + 3,
          //margin: EdgeInsets.all(isBig ? width10 * 0.2 : width10 / 8),
          child: ColumnSuper(
            innerDistance: 8.0,
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                //     height: 80,
                // width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  child: img,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ));

    //if (focusedMenuItems == null) {
    return InkWell(
      onTap: onClick,
      child: widget,
    );
  }
}
