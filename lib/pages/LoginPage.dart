import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = "/LoginPage";

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () async {
                      Navigator.pushNamed(context,"/InitProfile");
                    },
                  )
                ]
              ),

            ]
        ),
      ),
    );
  }
}