import 'dart:convert';
import 'package:illustrare/auth/TokenManager.dart';
import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/models/TokenModel.dart';

import '../models/CreateProfileModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';

class IllustrareService{
  // TODO: change parameters on deployment.
  final String _host = "http://204f-24-133-86-35.ngrok.io";

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

  String addSinglePhotoPath(){
    return "addSinglePhoto";
  }

  Future<String> createJson(Map<String, dynamic> body) async {
    var token = TokenManager.instance.getToken();
    return jsonEncode({
      "userToken": token,
      "body": body});

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
    var token = (await TokenManager.instance.getToken())!;
    var uri = Uri.http(_host,createProfilePath());

    var response = await _dio.postUri(
      uri,
      data: createJson(model.toJson())
    );
    return BaseResponse(response.data["success"],response.data["msg"]);
  }

  Future<BaseResponse> addSinglePhoto(SinglePhotoModel model) async {
    var uri = Uri.http(_host,addSinglePhotoPath());

    var response = await _dio.postUri(
        uri,
        data: createJson(model.toJson())
    );
    return BaseResponse(response.data["success"],response.data["msg"]);
  }
}