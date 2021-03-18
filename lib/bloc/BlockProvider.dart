import 'package:comics/bloc/ComicsBloc.dart';
import 'package:flutter/material.dart';

class BlockProvider extends InheritedWidget{
  final ComicsBloc bloc;
  BlockProvider({this.bloc, Widget child,Key key}):super(key:key,child:child);


  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget)=> true;

  static ComicsBloc of (BuildContext context)=>
  (context.dependOnInheritedWidgetOfExactType<BlockProvider>()).bloc;

}