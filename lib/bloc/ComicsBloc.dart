import 'dart:math';

import 'package:comics/bloc/Bloc.dart';
import 'package:comics/services/ComicService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:comics/model/Comic.dart';

import 'events/ComicEvent.dart';

class ComicsBloc implements Bloc{
  var _comicsController = ReplaySubject<Comic>();
  var _likedComicController= ReplaySubject<List<Comic>>();
  List<Comic> _likedComic=[];
  Stream<List<Comic>> get outLikedComics => _likedComicController.stream;

  Stream<Comic> get outNewComic => _comicsController.stream;
  ComicService _comicService= ComicService();


  void dispatch(ComicEvent event){
    switch(event.runtimeType){
      case LikeEvent:
      _likeReducer(event.comic);
      break;
      case DislikeComic:
      _dislikeReducer(event.comic);
      break;
      case RequestNewEvent:
      _newEventReducer();
      break;
  
      default:
      break;
    }
    
  }
  Future<Comic> getNewComicFromServer(){
    var id = Random().nextInt(2400)+10;
    return _comicService.getComic(id);
  }
  void _newEventReducer(){
    getNewComicFromServer().then((comic) =>_comicsController.sink.add(comic) );
    
  }
  void _likeReducer(Comic comic){
    _likedComic.add(comic);
    _likedComicController.sink.add(_likedComic);

  }
  void _dislikeReducer(Comic comic){
    _newEventReducer();

  }
  @override
  void dispose() {
    _comicsController.close();
    _likedComicController.close();
  }

}