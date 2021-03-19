
import 'package:comics/bloc/BlockProvider.dart';
import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/model/Comic.dart';
import 'package:comics/repository/ComicRepository.dart';
import 'package:comics/repository/Repositroy.dart';
import 'package:comics/widgets/ExtenedComicWidget.dart';
import 'package:comics/widgets/ListItemWidget.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavouriteWidgetState();
}

class FavouriteWidgetState extends State<FavouriteWidget> {
  ComicsBloc _bloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlockProvider.of(context);
  }

  Repository repository = ComicRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(100, 245,245,245),
      child: StreamBuilder<List<Comic>>(
          stream: _bloc.outLikedComics,
          builder: (BuildContext context, AsyncSnapshot<List<Comic>> snap) {
            if (snap.hasData) {
              print(snap.data.first.title);
              return ListView.builder(
                  
                  itemCount: snap.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItemWidget(
                      comic: snap.data[index],
                     
                    );
                  });
            } else if (snap.hasError) {
              return Container(
                child: Center(child: Text("Error")),
              );
            } else {
              return Center(
                  child: Text(
                "Nothing is liked..",
                style: TextStyle(
                   
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ));
            }
          }),
    );
  }
}
