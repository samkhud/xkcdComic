import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/bloc/events/ComicEvent.dart';
import 'package:comics/model/Comic.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Test get random event', () async {
    final ComicsBloc bloc= ComicsBloc();
     bloc.dispatch(RequestNewEvent());
     var result = await bloc.outNewComic.first;
     expect(result.runtimeType,Comic);
    
  });
  
  test('Test like event', () async {
    final ComicsBloc bloc= ComicsBloc();
    final Comic comic = Comic("title","img");
    final Comic comic2 = Comic("title2","img2");
    var comics= [comic,comic2];
     bloc.dispatch(LikeEvent(comic));
     bloc.dispatch(LikeEvent(comic2));
     var result = await bloc.outLikedComics.first;
       expect(result ,comics);

  });

}