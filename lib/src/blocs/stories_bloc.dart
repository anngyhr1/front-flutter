import 'dart:async';
import 'package:news/src/models/storie_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _stories = PublishSubject<List<StorieModel>>();
  final _storiesOutput = BehaviorSubject<List<StorieModel>>();
  final _currStorieDetail = BehaviorSubject<StorieModel>();
  final scrollController = ScrollController();
  final _pageNumber = BehaviorSubject<int>();
  final _hasMore = BehaviorSubject<bool>();

  // Getters to Streams
  Observable<List<StorieModel>> get storieList => _storiesOutput.stream;
  Observable<List<StorieModel>> get stories => _stories.stream;
  Observable<StorieModel> get currStorieDetail => _currStorieDetail.stream;

  // Getters to Sinks
  Function(int) get setPageNumber => _pageNumber.sink.add;
  Function(bool) get setHasMore => _hasMore.sink.add;
  Function(List<StorieModel>) get setStorieList => _storiesOutput.sink.add;
  Function(StorieModel) get setCurrStorieDetail => _currStorieDetail.sink.add;

  StoriesBloc() {
    print("IN constructor StoriesBloc()");
    stories.transform(_storiesTransformer()).pipe(_storiesOutput);
    print('StoriesBloc setHasMore(true)');
    setHasMore(true);
    setPageNumber(0);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        loadMore();
      }
    });
  }

  _storiesTransformer() {
    return ScanStreamTransformer(
      (List<StorieModel> cache, List<StorieModel> stories, index) {
        if (_pageNumber.value == 0) cache.clear();
        cache.addAll(stories);
        print("cache :: " + cache.toString());
        return cache;
      },
      <StorieModel>[],
    );
  }

  loadMore() async {
    bool hasmore = _hasMore.value;
    print('IN loadMore, hasmore ' + hasmore.toString());
    if (hasmore) {
      if (_pageNumber.value == 0) {
        _stories.sink.add([]);
      }
      print("Stories Bloc, _pageNumber :: " + _pageNumber.value.toString());
      List<StorieModel> storieList =
          await _repository.fetchStoriesLazy("", _pageNumber.value, "stories");

      if (storieList.isEmpty) {
        setHasMore(false);
        print('loadMore setHasMore(false) ' + _hasMore.value.toString());
      } else {
        setPageNumber(_pageNumber.value + 1);
        _stories.sink.add(storieList.toList());
      }
    }
  }

  dispose() {
    _stories.close();
    _pageNumber.close();
    _storiesOutput.close();
    _hasMore.close();
    _currStorieDetail.close();
  }
}
