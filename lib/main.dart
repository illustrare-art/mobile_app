import 'package:flutter/material.dart';
import 'package:illustrare/pages/HomePage.dart';
import 'package:illustrare/pages/InitProfile.dart';
import 'package:illustrare/pages/LoginPage.dart';
import 'package:illustrare/pages/UploadYourImage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Illustrare',
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        UploadYourImage.id: (context) => UploadYourImage(),
        InitProfile.id: (context) => InitProfile()
      }
    );
  }
}



