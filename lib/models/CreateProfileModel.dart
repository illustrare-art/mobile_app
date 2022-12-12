import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:illustrare/auth/UserManager.dart';
import 'package:path/path.dart' as p;

class CreateProfileModel {
  String? username;
  String? phoneNumber;
  File? photo;

  CreateProfileModel({this.username,  this.phoneNumber, this.photo});

  Future<FormData> toJson() async {
    if(photo  == null){
      return FormData.fromMap({
        "username":username,
        "profile_photo":null,
        "user_id":(await UserManager.instance.getUser())!.userId
      });
    }else{
      var filePath = photo!.path;
      var file = MultipartFile.fromFileSync(filePath,filename:p.basename(filePath),contentType: MediaType.parse("image/png"));
      return FormData.fromMap({
        "username": username,
        // 'phone_number': phoneNumber,
        "profile_photo":file,
        "user_id":(await UserManager.instance.getUser())!.userId
      });
    }

  }
// CreateProfileModel.withError(String s) {}
}
