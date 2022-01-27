import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/models/StreamListenableBuilder.dart';
import 'dart:developer';
import 'package:illustrare/pages/login/LoginBloc.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = "/LoginPage";

  _LoginPageState createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return StreamListenableBuilder<AppUserModel>(
        stream: bloc.subject.stream,
        listener: (value) {
          if(value != null){
            if(value.userId != null){
              if(value.userName != null) Navigator.pushNamed(context,"/FeedPage");
              else Navigator.pushNamed(context,"/CreateProfile");
            }
          }
        },
        builder: (context, AsyncSnapshot<AppUserModel> snapshot){
          return _buildNoUser(context);
    });
  }


  Widget _buildNoUser(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF292C6D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "ILLUSTRARE",
                textScaleFactor: .75,
                style:TextStyle(
                  color:Color(0XFFFFFFFF),
                  fontSize:64,
                  fontWeight:FontWeight.bold,
                )
              ),
              Column(
                children:[
                  SignInButton(
                    Buttons.Google,
                    onPressed: bloc.getUser

                  )
                ]
              ),

            ]
        ),
      ),
    );
  }
}