import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:illustrare/components/CollectionCard.dart';

import 'FeedItem.dart';

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

        // TODO: Example usage.
          children:[
            FeedItem(
              "1",
              "ovuruska",
              "https://ovuruska-nft.s3.amazonaws.com/image_773.png",
              1000000,
              1000
            ),
            FeedItem(
                "1",
                "ovuruska",
                "https://gateway.pinata.cloud/ipfs/QmfJF7KQx67uM5NxWx8uCZgAKhBdVWHTedrxr35nEzFWRH",
                1500,
                55
            )
          ]
      ),
    );
  }
}