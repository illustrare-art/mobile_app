import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as p;

class CreateProfileModel {
  String? username;
  String? phoneNumber;
  File? photo;

  CreateProfileModel({this.username,  this.phoneNumber, this.photo});

  FormData toJson()  {
    if(photo  == null){
      return FormData.fromMap({
        "username":username,
        "profile_photo":null
      });
    }else{
      var filePath = photo!.path;
      return FormData.fromMap({
        "username": username,
        // 'phone_number': phoneNumber,
        "profile_photo": MultipartFile.fromBytes(photo!.readAsBytesSync(),filename:p.basename(filePath),contentType: MediaType.parse("image/png"))
      });
    }


  }
// CreateProfileModel.withError(String s) {}
}
