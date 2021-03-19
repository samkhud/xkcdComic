import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/bloc/events/ComicEvent.dart';
import 'package:comics/model/Comic.dart';
import 'package:flutter/material.dart';

class ExtendedComicWidget extends StatelessWidget {
  final Comic comic;
  final ComicsBloc bloc;
  final bool bottons;

  const ExtendedComicWidget ({Key key, this.comic, this.bloc, this.bottons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 1.02,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Card(
              elevation: 1,
              child: SafeArea(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 22),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            comic.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.125,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Image.network(
                          comic.img,
                          fit: BoxFit.contain,
                        ),
                      ),
                      bottons
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                   Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                18),
                                        child: ClipOval(
                                          
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow:[ BoxShadow(color: Colors.grey,
                                              blurRadius: 4,
                                               offset: Offset(4, 8)


                                              )
                                            ],),
                                            child: Material(
                                            
                                             
                                              child: InkWell(
                                                key: Key("dislike_button"),
                                                splashColor:
                                                    Colors.red, // inkwell color
                                                child: SizedBox(
                                                    width: 70,
                                                    height: 70,
                                                    child: Icon(Icons.close,color:Colors.red,size:40)),
                                                onTap: () => {
                                               
                                                  bloc.dispatch(RequestNewEvent())
                                                },
                                              ),
                                            ),
                                          ),
                                        )),
                                   Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                18),
                                        child: ClipOval(
                                          
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow:[ BoxShadow(color: Colors.grey,
                                              blurRadius: 4,
                                               offset: Offset(4, 8)
                                               
                                              )
                                            ],),
                                            child: Material(
                                            
                                              // button color
                                              child: InkWell(
                                                key:Key("like_button"),
                                                splashColor:
                                                    Colors.green, // inkwell color
                                                child: SizedBox(
                                                    width: 70,
                                                    height: 70,
                                                    child: Icon(Icons.favorite,color:Colors.green,size: 40,)),
                                                onTap: () => {
                                                  bloc.dispatch(LikeEvent(comic)),
                                                  bloc.dispatch(RequestNewEvent())
                                                },
                                              ),
                                            ),
                                          ),
                                        )),
                                  
                                ])
                          : Container()
                    ],
                  ),
                ),
              ))),
    );
  }
}
