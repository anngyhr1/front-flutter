import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import 'package:news/src/models/storie_model.dart';
import 'package:news/src/screens/storie_detail_header.dart';
import 'package:news/src/screens/story_line.dart';
import 'package:news/src/widgets/chip/container.dart';

class StorieDetailsPage extends StatelessWidget {
  StorieDetailsPage();
  static Future<void> show(BuildContext context, StorieModel storie) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: false,
        builder: (context) =>
            StorieDetailsPage(/*database: database, storie: storie*/),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: buildBody(bloc),
    );
  }

  Widget buildBody(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.currStorieDetail,
      builder: (context, AsyncSnapshot<StorieModel> snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading');
        }
        print('buildBody snapshot ' + snapshot.data.title);

        return buildTile(snapshot.data);
      },
    );
  }

  Widget buildTile(StorieModel storie) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StorieDetailHeader(storie),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Storyline(storie.text),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              height: 100,
              //   mainAxisSize: MainAxisSize.min,
              // child: //[
              //     Expanded(
              child: ListView(
                //shrinkWrap: true,
                addAutomaticKeepAlives: true,
                children: <Widget>[
                  Content(
                    //  title: 'Categorias',
                    child: ChipsChoice<int>.single(
                      value: null,
                      onChanged: (val) => print(storie.categories[val]),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: storie.categories,
                        value: (i, v) => i,
                        label: (i, v) => v,
                        tooltip: (i, v) => v,
                      ),
                    ),
                  ),
                ],
              ),
              //  ),
              // ],
            ),
          ),

          // PhotoScroller(movie.photoUrls),
          // SizedBox(height: 20.0),
          // ActorScroller(movie.actors),
        ],
      ),
    );
  }
}
