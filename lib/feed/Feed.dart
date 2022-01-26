import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:illustrare/components/CollectionCard.dart';

class HomePage extends StatelessWidget {
  static String id = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight =  MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF292C6D),
      body: Column(

          children:[
            Container(
                margin: EdgeInsets.only(top: screenHeight/10),
                child: const Text(
                    'Collections',
                    textAlign: TextAlign.left,
                    style:TextStyle(
                        color:Color(0xFFFFFFFF),
                        fontSize:48
                    )
                )
            ),
            CollectionCard()
          ]
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}