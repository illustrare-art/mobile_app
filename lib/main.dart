import 'package:flutter/material.dart';
import 'package:illustrare/pages/HomePage.dart';
import 'package:illustrare/pages/createProfile/CreateProfileView.dart';
import 'package:illustrare/pages/feed/FeedView.dart';
import 'pages/login/LoginView.dart';
import 'package:illustrare/pages/UploadYourImage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(name:"illustrare-53f71");
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
        UploadYourImage.id: (context) => UploadYourImage(),
        CreateProfile.id: (context) => CreateProfile(),
        FeedView.id : (context) => FeedView()
      }
    );
  }
}



