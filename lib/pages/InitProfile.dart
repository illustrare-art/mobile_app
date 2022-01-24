import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:path/path.dart' as p;

class InitProfile extends StatefulWidget{
  static String id = "/InitProfile";

  @override
  _InitProfileState createState() => _InitProfileState();
}



class _InitProfileState extends State<InitProfile>{


  @override
  Widget build(BuildContext context) {
    double screenWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFF4ECFF),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Container(
                margin:EdgeInsets.only( top:48),

                child:Center(
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(128),
                      // TODO: backgroundImage GoogleSignIn profil fotoğrafı
                        child:Image.asset( p .join("assets","images","oguz.png"),width:256,height:256)
            ))),
            Container(
              margin:EdgeInsets.only( top:8),

              child:Text("Edit Your Profile Photo",style:TextStyle(color:Color(0xFF00C89B),fontSize:16,fontWeight: FontWeight.w700))
            ),
            Container(
                margin:EdgeInsets.only( top:48),
                width:screenWidth*.9,
              child:TextField(
                decoration: InputDecoration(labelText: 'Username'),
              )
            ),
            Container(
                margin:EdgeInsets.only( top:32),
                width:screenWidth*.9,
                child:TextField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                )
            ),
            Container(
                margin:EdgeInsets.only( top:32),

              child:TextButton(
                  onPressed: () { Navigator.pushNamed(context, "/HomePage"); },
                  style:TextButton.styleFrom(
                    backgroundColor: Color(0xFF00C89B),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),

                  )),
                  child:Text(
                    "Start",
                    style: TextStyle(fontSize:32,color:Colors.white)
              ))
            )
          ]
      ),

      bottomNavigationBar: BottomBar(),

    );
  }

}