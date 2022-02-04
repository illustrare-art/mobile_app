import 'dart:convert';
import 'dart:developer';

import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/TokenModel.dart';

import '../models/CreateProfileModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class IllustrareService{
  // TODO: change parameters on deployment.
  final String _host = "http://c46c-24-133-86-35.ngrok.io";

  final Dio _dio = Dio(BaseOptions(headers: {
    'Connection': 'keep-alive',
    'Accept': "*/*",
    "Content-Type":"application/json"
  }));


  String loginPath(){
    return "api/auth/login/google";
  }

  String createProfilePath(){
    return "createProfile";
  }

  Future<BaseResponse> login(TokenModel model) async{
    /// Uri.http("example.org", "/path", { "q" : "dart" });
    // TODO: Update the code below on production.
    // var uri = Uri(
    //     //   scheme: "http",
    //     //   host:"localhost",
    //     //   pathSegments: <String>["api","auth","login","google"],
    //     //   queryParameters:model.toJson()
    //     // );
    var uri = _host + "/api/auth/login/google?access_token=" + model.accessToken.toString();
    var response = await _dio.get(uri.toString());
    return BaseResponse(response.data["success"],response.data["msg"]);

  }


  Future<BaseResponse> createProfile( CreateProfileModel model) async {
    var user = (await UserManager.instance.getUser())!;
    var uri = Uri.http(_host,createProfilePath());

    var response = await _dio.postUri(
      uri,
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