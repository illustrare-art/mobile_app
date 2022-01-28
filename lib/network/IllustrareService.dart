import 'dart:convert';
import 'dart:developer';

import 'package:illustrare/auth/UserManager.dart';

import '../models/CreateProfileModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

class IllustrareService{
  final String _endpoint = "https://us-central1-illustrare-53f71.cloudfunctions.net/api";
  final Dio _dio = Dio(BaseOptions(headers: {
    "Content-Type":"application/json"
  }));

  String createProfileUrl() {
    return _endpoint + "/create_profile";
  }

  Future<BaseResponse> createProfile( CreateProfileModel model) async {
    var user = (await UserManager.instance.getUser())!;

    var response = await _dio.post(
      createProfileUrl(),
      data:jsonEncode({
        "user_id":user.userId,
        "username":model.username,
        "profile_photo":user.photoUrl,
        "phone_number":model.phoneNumber
      })
    );


    return BaseResponse(response.data["success"],response.data["msg"]);
  }
}