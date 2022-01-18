import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class CollectionCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth =  MediaQuery.of(context).size.width;

    return Center(

      child:Container(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          color:Color(0xFF161853),
          child:Column(
            children:[
              Container(
                  margin:EdgeInsets.only( left:32,top:32,right:32,bottom:8),
                  child:Image.asset(
                  p.join("assets","images","oguz.png"),
                  width:screenWidth*.5,
                  height:screenWidth*.5,
              ))
              ,
              Text("They Live",
                style: TextStyle(fontSize:32,color:Color(0xFFFFFFFF))
              ),
              Container(
                  width:screenWidth*.5,
                  child:Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[Container(
                        margin:EdgeInsets.only( top:16,bottom:16),
                      child:Text(
                      "by Yagiz Eyiisleyen",
                      style: TextStyle(fontSize:16,color:Color(0xFFFFFFFF))
                      )),
                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.only( ),
                        child:Image.asset(
                          p.join("assets","images","yagiz.png"),
                          width:24,
                          height:24,
                        ))
                  ]
              )),
              Container(
                  margin:EdgeInsets.only( top:16,bottom:16),
                  child:TextButton(
                    style:TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      )
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context,"/UploadYourImage");
                    },
                    child:Text(
                      "Order Now",
                    style: TextStyle(fontSize:24,color:Color(0xFF161853))
                  )
              ))
            ]
          )
        )
      )
    );
  }
}