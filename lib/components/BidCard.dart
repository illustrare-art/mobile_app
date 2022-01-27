import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class CollectionCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth =  MediaQuery.of(context).size.width;

    return Center(

        child:Container(
            width:screenWidth*.75,
            child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                ),
                color:Color(0xFF4B4385),
                child:Column(
                    children:[
                      Container(
                          margin:EdgeInsets.all( 0),

                          child:ClipRRect(
                              borderRadius:BorderRadius.circular(8),
                              child:Image.asset(
                                //TODO: cardImage will be variable.
                                p.join("assets","images","oguz.png"),
                                width:screenWidth*.75,
                                height:screenWidth*.75,
                              )
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Container(
                              child:Text("They Live",style: TextStyle(fontSize:24,color:Color(0xFFFFFFFF))),
                              margin:EdgeInsets.only( left:8),


                            ),
                            Container(
                                height:48,
                                margin:EdgeInsets.only(right:8 ),

                                child:Row(

                                    children:[
                                      Container(
                                          margin:EdgeInsets.only( right:4 ),
                                          child:Text(
                                              "by Yagiz Eyiisleyen",
                                              style: TextStyle(fontSize:12,color:Color(0xFFFFFFFF))
                                          )),
                                      Container(
                                          alignment: Alignment.center,
                                          margin:EdgeInsets.only( ),
                                          child:ClipRRect(
                                              borderRadius:BorderRadius.circular(8),
                                              child:Image.asset(
                                                //TODO: cardImage will be variable.
                                                p.join("assets","images","yagiz.png"),
                                                width:16,
                                                height:16,
                                              )
                                          ))
                                    ]))
                          ])
                    ]))));
  }
}