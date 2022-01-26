import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = "/LoginPage";
  _LoginPageState createState() => _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    inspect(googleUser);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                      await signInWithGoogle();
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