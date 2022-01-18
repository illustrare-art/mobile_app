import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:illustrare/components/BottomBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class UploadYourImage extends StatefulWidget{
  static String id = "/UploadYourImage";

  @override
  _UploadYourImageState createState() => _UploadYourImageState();
}



class _UploadYourImageState extends State<UploadYourImage>{

  UploadTask task;
  File uploadImagePath;

  Future<void> selectImage() async {
    final ImagePicker _picker = ImagePicker();

    var image = await _picker.pickImage(source: ImageSource.gallery);
    if( image != null){
      var imagePath = File(image.path);
      setState((){
        uploadImagePath = imagePath;
      });

    }
  }


  uploadImage() async {
    if (uploadImagePath != null){
      var imagePath = uploadImagePath.path;
      var imageBasename = p.basename(imagePath);
      
      final _storage = FirebaseStorage.instance;
      var snapshot = await _storage.ref()
          .child("asdf/$imageBasename")
          .putFile(uploadImagePath)
          .whenComplete(() => null);
    }

  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =  MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * .75;

    return Scaffold(
      backgroundColor: Color(0xFF292C6D),
      body: Column(
          children:[

                Container(
                  margin:EdgeInsets.only( left:32,top:screenWidth/10,right:32,bottom:16),

                  child:(uploadImagePath != null)
                      ? Image.file(
                      uploadImagePath,
                      width:imageWidth,
                      height:imageWidth
                  ) : Placeholder(fallbackHeight: imageWidth,fallbackWidth:imageWidth),

            ),
            (uploadImagePath != null) ?
            Container(
                margin:EdgeInsets.only( top:16,bottom:16),
                child:TextButton(
                    style:TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(color: Colors.red)
                        )
                    ),
                    onPressed: uploadImage,
                    child:Text(
                        "Upload",
                        style: TextStyle(fontSize:24,color:Color(0xFF161853))
                    )
                ))
                :
            Container(
              margin:EdgeInsets.only( top:16,bottom:16),
              child:TextButton(
                style:TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
                side: BorderSide(color: Colors.red)
                )
              ),
              onPressed: selectImage,
              child:Text(
              "Select",
              style: TextStyle(fontSize:24,color:Color(0xFF161853))
              )
            ))

          ]
      ),

      bottomNavigationBar: BottomBar(),

    );
  }

}