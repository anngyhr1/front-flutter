import 'package:news/src/models/storie_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class WelcomeBloc {
  final _repository = Repository();
  final _mLikedStorieTapped = BehaviorSubject<StorieModel>();
  final _mViewedStorieTapped = BehaviorSubject<StorieModel>();
  final _mostLikedStories = PublishSubject<List<StorieModel>>();
  final _mostViewedStories = PublishSubject<List<StorieModel>>();

// Getters to Streams
  Observable<StorieModel> get mLikedStorieTapped => _mLikedStorieTapped.stream;
  Observable<StorieModel> get mViewedStorieTapped =>
      _mViewedStorieTapped.stream; //.startWith(storieInit);
  Observable<List<StorieModel>> get mostLikedStories =>
      _mostLikedStories.stream;
  Observable<List<StorieModel>> get mostViewedStories =>
      _mostViewedStories.stream;

// Getters to Sinks
  Function(StorieModel) get setMLikedStorieTapped =>
      _mLikedStorieTapped.sink.add;
  Function(StorieModel) get setMViewedStorieTapped =>
      _mViewedStorieTapped.sink.add;
  Function(List<StorieModel>) get setLikedStories => _mostLikedStories.sink.add;
  Function(List<StorieModel>) get setViewedStories =>
      _mostViewedStories.sink.add;

  loadWelcome() async {
    List<StorieModel> mostLikedStories =
        await _repository.fetchStoriesLazy("", 0, "mostLiked");
    setLikedStories(mostLikedStories.toList());
    List<StorieModel> mostViewedStories =
        await _repository.fetchStoriesLazy("", 0, "mostViewed");
    setViewedStories(mostViewedStories.toList());
    await setMLikedStorieTapped(mostLikedStories[0]);
    await setMViewedStorieTapped(mostViewedStories[0]);
  }

  dispose() {
    _mLikedStorieTapped.close();
    _mostLikedStories.close();
    _mostViewedStories.close();
    _mViewedStorieTapped.close();
  }
}
