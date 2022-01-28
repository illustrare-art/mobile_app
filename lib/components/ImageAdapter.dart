import 'dart:io';
import 'package:flutter/material.dart';

class ImageAdapter extends StatelessWidget {

  String imagePath;
  double? width;
  double? height;
  ImageAdapter({required this.imagePath,this.width,this.height});

  static bool isValidUrl(String url){
    return Uri.parse("https://google.com/").host == '' ? false : true;

  }

  @override
  Widget build(BuildContext context) {
    return  (ImageAdapter.isValidUrl(this.imagePath)) ? Image.file(
      File(this.imagePath),
      width:this.width,
      height:this.height
      ):Image.network(this.imagePath,width:this.width,height:this.height);
  }
}
