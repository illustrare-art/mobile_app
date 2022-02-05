import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:illustrare/components/CollectionCard.dart';

class FeedView extends StatelessWidget {
  static String id = "/Feed";

  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight =  MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF292C6D),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        backgroundColor: Color(0xFF00C89B),
        child:Icon(Icons.add,color:Color(0xFFF4ECFF) ),
        onPressed: () {
          Navigator.pushNamed(context, "/AddPhoto");
        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
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
    );
  }
}