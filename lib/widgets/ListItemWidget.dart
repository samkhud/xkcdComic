import 'package:comics/bloc/ComicsBloc.dart';
import 'package:comics/model/Comic.dart';
import 'package:comics/pages/ExtendedComicPage.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final Comic comic;
  final ComicsBloc bloc;
  const ListItemWidget({Key key, this.comic,this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
        Navigator.push(
          context,
          MaterialPageRoute(builder:(context)=>ExtendedComicPage(
            comic:comic,
            
            bloc: bloc,
            ))
        )
      },
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
            child: Container(
            
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 6,
              child: Container(
                margin: EdgeInsets.only(bottom:7.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                      color:Colors.grey,
                      offset:Offset(0.0,1.0),
                      blurRadius: 7.0
                    )

                  ]
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        comic.img,
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      Flexible(
                           child: Text(
                          comic.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        
      ),
    );
  }
}
