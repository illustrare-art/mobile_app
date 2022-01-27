import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:illustrare/models/StreamListenableBuilder.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:path/path.dart' as p;
import "./CreateProfileBloc.dart";

class CreateProfile extends StatefulWidget{
  static String id = "/CreateProfile";

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile>{

  String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return StreamListenableBuilder<BaseResponse>(
        stream: bloc.subject.stream,
        listener: (value) {
          if(value != null){
          }
        },
        builder: (context, AsyncSnapshot<BaseResponse> snapshot) {

          return _buildScreen();
        });
  }

  @override
  void initState(){
    super.initState();
    bloc
        .getUser()
        .then((user) {
        if(user.photoUrl != null){
            setState(() {
              photoUrl = user.photoUrl;
            });
        }
    });
  }

  Widget _buildScreen() {
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
                      // TODO: yerelden yüklenen fotoğrafları handle et.
                      // Image.network sadece GoogleSignIn ile gelen fotoğrafı kapsıyor.
                      child:(photoUrl != null)  ? Image.network(photoUrl!,width:256,height:256)  : Placeholder(fallbackHeight: 256,fallbackWidth:256)
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