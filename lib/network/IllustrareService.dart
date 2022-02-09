import 'dart:convert';

import "package:cookie_jar/cookie_jar.dart";
import 'package:dio/dio.dart';
import "package:dio_cookie_manager/dio_cookie_manager.dart";
import 'package:illustrare/auth/TokenManager.dart';
import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/models/TokenModel.dart';
import 'package:illustrare/network/BaseResponse.dart';

import '../models/CreateProfileModel.dart';

class IllustrareService {
  static IllustrareService? _instance;

  IllustrareService._();

  static IllustrareService get instance => _instance ??= IllustrareService._();

  // TODO: change parameters on deployment.
  final String _host = "http://e537-24-133-86-35.ngrok.io";
  static CookieManager _cj = CookieManager(CookieJar());

  getDio() {
    Dio dio = Dio();
    dio.interceptors.add(_cj);
    return dio;
  }

  String loginPath() {
    return "/api/auth/login/google";
  }

  String initUserPath() {
    return "/api/users/init";
  }

  String addSinglePhotoPath() {
    return "addSinglePhoto";
  }

  Future<String> createJson(Map<String, dynamic> body) async {
    var token = await TokenManager.instance.getToken();
    return jsonEncode({"userToken": token, "body": body});
  }

  Future<BaseResponse> login(TokenModel model) async {
    var uri =
        _host + loginPath() + "?access_token=" + model.accessToken.toString();

    var response = await getDio().get(uri.toString());
    print(response.headers);
    return BaseResponse(response.data["success"], response.data["msg"]);
  }

  Future<BaseResponse> createProfile(CreateProfileModel model) async {
    var uri = Uri.parse(_host + initUserPath());

    var requestBody = model.toJson();

    var response = await getDio().postUri(uri,
        data: requestBody,
        options: Options(headers: {
          "Authorization": (await TokenManager.instance.getToken())!.idToken
        }));

    return BaseResponse(response.data["success"], response.data["msg"]);
  }

  Future<BaseResponse> addSinglePhoto(SinglePhotoModel model) async {
    var uri = Uri.http(_host, addSinglePhotoPath());

    var response =
        await getDio().postUri(uri, data: createJson(model.toJson()));
    return BaseResponse(response.data["success"], response.data["msg"]);
  }
}
