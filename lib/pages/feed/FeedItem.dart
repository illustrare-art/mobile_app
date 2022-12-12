import 'package:flutter/material.dart';
import 'package:illustrare/constants.dart';

class ItemHeader extends StatelessWidget {
  int views;
  int likes;
  String artistName;

  ItemHeader(this.artistName, this.views, this.likes);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only( top:64,bottom:4),

        child:Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only( left: 8),
              child: Text(artistName,
                  style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontSize: 16,
                  ))),
          Container(
              margin: EdgeInsets.only( right: 8),
              width: 192,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 8),

                        child: SizedBox(
                            width: 64,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(FeedItem.beautifyNumber(likes),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 16,
                                      )),
                                  Icon(Icons.favorite,
                                      color: GREEN_BUTTON_COLOR)
                                ]))),
                    Container(
                        child: SizedBox(
                            width: 64,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(FeedItem.beautifyNumber(views),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0XFFFFFFFF),
                                        fontSize: 16,
                                      )),
                                  Icon(Icons.remove_red_eye_sharp,
                                      color: GREEN_BUTTON_COLOR)
                                ])))
                  ]))
        ]));
  }
}

class FeedItem extends StatelessWidget {
  String image;
  int views;
  int likes;
  String artistId;
  String artistName;

  FeedItem(this.artistId, this.artistName, this.image, this.views, this.likes);

  static String beautifyNumber(int number) {
    double result;
    if (number < 1000) {
      return number.toString();
    } else if (number >= 1000 && number < 1000000) {
      result = number / 1000;
      return result.toStringAsFixed(1) + "k";
    } else {
      result = number / 1000000;
      return result.toStringAsFixed(1) + "m";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // width:screenWidth,
    // height:screenWidth,
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemHeader(artistName, views, likes),
              Image.network(image)
            ]));
  }
}
