import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/model/Comic.dart';
import 'package:comics/widgets/ExtenedComicWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtendedComicPage extends StatelessWidget {
  final ComicsBloc bloc;
  final Comic comic;
  const ExtendedComicPage({Key key,this.bloc,this.comic}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ExtendedComicWidget(comic: comic,bloc: bloc,bottons: false,)
    );
  }
}