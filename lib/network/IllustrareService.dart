import 'dart:convert';
import 'dart:developer';

import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/TokenModel.dart';

import '../models/CreateProfileModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';

class IllustrareService{
  // Todo change parameters on deployment.
  final String _host = "localhost";

  final Dio _dio = Dio(BaseOptions(headers: {
    "Content-Type":"application/json",
    'Connection': 'keep-alive',
    'Accept': "*/*",

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
    var uri = Uri(
      scheme: "http",
      host:"localhost",
      port:8000,
      pathSegments: <String>["api","auth","login","google"],
      queryParameters:model.toJson()
    );
    log(uri.toString());
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