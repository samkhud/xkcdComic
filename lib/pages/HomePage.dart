
import 'package:comics/pages/FavouriteWidget.dart';
import 'package:comics/pages/ComicWidget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
  
  



}
class _HomePageState extends State<HomePage>{
  List<Widget>screens=[ComicWidget(),FavouriteWidget()];
  List<Widget>titles =[
    Text("Comics",
    style: TextStyle(
      fontFamily: "chango-Regular",
      color: Colors.black,
      fontWeight: FontWeight.bold),),
      Text("Liked",
      
      style: TextStyle(
        color: Colors.black,
        fontFamily: "chango-Regular",
      fontWeight: FontWeight.bold))];
  int _selectIndex = 0;
  void _onIcontaped(int index){
    setState(() {
      _selectIndex=index;
      
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child:titles[_selectIndex] ),

      ),
      body: IndexedStack(
        index:_selectIndex,
        children: screens,
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home" ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourites")
        ],
        currentIndex: _selectIndex,
        selectedItemColor:Colors.black,
        onTap: _onIcontaped,


      ),
      

    );
  }

}

