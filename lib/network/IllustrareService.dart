import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:illustrare/auth/TokenManager.dart';
import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/models/TokenModel.dart';
import 'package:illustrare/network/BaseResponse.dart';

import '../models/CreateProfileModel.dart';
import "package:dio_cookie_manager/dio_cookie_manager.dart";
import "package:cookie_jar/cookie_jar.dart";

class IllustrareService {
  // TODO: change parameters on deployment.
  final String _host = "http://204f-24-133-86-35.ngrok.io";

  final CookieJar cj = CookieJar();

  final Dio _dio = Dio(BaseOptions(headers: {
    'Connection': 'keep-alive',
    'Accept': "*/*",
    "Content-Type": "application/json"
  }));

  IllustrareService(){
    _dio.interceptors.add(CookieManager(cj));
  }

  String loginPath() {
    return "api/auth/login/google";
  }

  String initUserPath() {
    return "api/users/init";
  }

  String addSinglePhotoPath() {
    return "addSinglePhoto";
  }

  Future<String> createJson(Map<String, dynamic> body) async {
    var token = await TokenManager.instance.getToken();
    return jsonEncode({"userToken": token, "body": body});
  }

  Future<BaseResponse> login(TokenModel model) async {
    var uri = _host +
        "/api/auth/login/google?access_token=" +
        model.accessToken.toString();
    var response = await _dio.get(uri.toString());
    return BaseResponse(response.data["success"], response.data["msg"]);
  }

  Future<BaseResponse> createProfile(CreateProfileModel model) async {

    var uri = Uri.parse(_host + initUserPath());

    var response = await _dio.postUri(uri,
        data: createJson(model.toJson()),
    );
    return BaseResponse(response.data["success"], response.data["msg"]);
  }

  Future<BaseResponse> addSinglePhoto(SinglePhotoModel model) async {
    var uri = Uri.http(_host, addSinglePhotoPath());

    var response = await _dio.postUri(uri, data: createJson(model.toJson()));
    return BaseResponse(response.data["success"], response.data["msg"]);
  }
}
