import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/blocs/welcome_bloc.dart';
import 'package:news/src/blocs/welcome_provider.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/widgets/home/constants.dart';
import 'package:news/src/widgets/home/cover_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final welcomeBloc = WelcomeProvider.of(context);
    welcomeBloc.loadWelcome();
    var width10 = MediaQuery.of(context).size.shortestSide / 10;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: buildList(width10, context, welcomeBloc),
    );
  }

  Widget buildList(
      double width10, BuildContext context, WelcomeBloc welcomeBloc) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        WelcomeCarousel(
            width: width10,
            titulo: 'Mejor rateadas',
            streamCarousel: welcomeBloc.mostLikedStories,
            streamTapped: welcomeBloc.mLikedStorieTapped,
            setTapped: welcomeBloc.setMLikedStorieTapped),
        WelcomeCarousel(
            width: width10,
            titulo: 'Mas leidas',
            streamCarousel: welcomeBloc.mostViewedStories,
            streamTapped: welcomeBloc.mViewedStorieTapped,
            setTapped: welcomeBloc.setMViewedStorieTapped)
      ],
    );
  }
}

class WelcomeCarousel extends StatelessWidget {
  final double width;
  final String titulo;
  final Observable<List<StorieModel>> streamCarousel;
  final Observable<StorieModel> streamTapped;
  final Function(StorieModel) setTapped;
  const WelcomeCarousel({
    this.width,
    this.titulo,
    this.streamCarousel,
    this.streamTapped,
    this.setTapped,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: ColumnSuper(
        alignment: Alignment.topLeft,
        innerDistance: 14.0,
        outerDistance: 20.0,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: Theme.of(context).textTheme.headline5,
              ),
              // ),
            ],
          ),
          Container(
            height: 3.0 * width,
            child: StreamBuilder(
                stream: streamCarousel,
                builder: (context, AsyncSnapshot<List<StorieModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  }
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    //padding: EdgeInsets.symmetric(horizontal: width / 4),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (ctx, index) {
                      //welcomeBloc.setTopStorieTapped(snapshot.data[index]);
                      //var album = stories[index];
                      return CoverImage(
                        image: 'images/banner.png',
                        title: snapshot.data[index].title,
                        // subtitle: stories[index].cuerpo,
                        // tag: album.id,
                        onClick: () {
                          setTapped(snapshot.data[index]);
                        },
                      );
                    },
                  );
                }),
          ),
          Row(children: [
            Flexible(
                flex: 1,
                child: StreamBuilder(
                    stream: streamTapped,
                    builder: (context, AsyncSnapshot<StorieModel> snapshot) {
                      if (!snapshot.hasData) {
                        return Text('Loading');
                      }
                      return AutoSizeText(
                        snapshot.data.text,
                        style: TextStyle(fontSize: 14),
                        minFontSize: 10,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      );
                    }) //),
                ),
          ]),
        ],
      ),
    );
  }
}
