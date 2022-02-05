import 'dart:io';

import 'package:flutter/material.dart';

class ImageAdaptor extends StatelessWidget {
  var imagePath;
  double? width;
  double? height;

  ImageAdaptor({required this.imagePath, this.width = 256, this.height = 256});

  @override
  Widget build(BuildContext context) {

    if (imagePath.runtimeType is String) {
      return Container(
          width: this.width,
          height: this.height,
          child: Image.network(
            this.imagePath,
          ));
    } else if (imagePath is File) {

      return Container(
          child: Image.file(imagePath,
              width: width, height: height));
    } else {
      return Container(
          width: this.width, height: this.height, child: Placeholder());
    }
  }
}
