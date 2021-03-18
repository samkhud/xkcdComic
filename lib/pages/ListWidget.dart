import 'dart:math';

import 'package:comics/bloc/BlockProvider.dart';
import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/bloc/events/ComicEvent.dart';
import 'package:comics/model/Comic.dart';
import 'package:comics/repository/ComicRepository.dart';
import 'package:comics/repository/Repositroy.dart';
import 'package:comics/widgets/ListItem.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ListWidgetState();
 
  



}
class _ListWidgetState extends State<ListWidget>{
  ComicsBloc _bloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc= BlockProvider.of(context);
    _bloc.dispatch(RequestNewEvent());
    
  }

    Repository repository= ComicRepository();
    
  @override
  Widget build(BuildContext context) {
    return   Container(
        child: StreamBuilder<Comic>(
          stream: _bloc.outNewComic ,
          builder: (BuildContext context,AsyncSnapshot<Comic>snap){
            if(snap.hasData){
              return Container(
                child:ListItem(
                  bottons: true,
                  bloc: _bloc,
                  comic:snap.data
                  )
              );
    
            }else if (snap.hasError){
              return Container(
                child: Center(child: Text("Error")),
              );

            }
            else{
              return Center(child: CircularProgressIndicator(),);

            }
          }
      ),

    );
  }

}

