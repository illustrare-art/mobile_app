import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {

  const BottomBar({Key? key}) : super(key: key);


  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>{


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color:Color(0xFFF4ECFF) ,
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(

              child:IconButton(
                icon:Icon(Icons.home,size:32,color:Color(0xFF161853)),
                onPressed: (){
                  Navigator.pushNamed(context,"/Feed");
                },
              ),
            ),
            Container(

              child:IconButton(
                icon:Icon(Icons.supervised_user_circle,size:32,color:Color(0xFF161853)),
                onPressed: (){},
              ),
            )



          ]
      ),

    );
  }
}