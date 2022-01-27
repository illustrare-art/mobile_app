import '../models/CreateProfileModel.dart';
import 'package:illustrare/product/ProductModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';
import 'package:cloud_functions/cloud_functions.dart';

class IllustrareService{
  final String _endpoint = "https://us-central1-illustrare-53f71.cloudfunctions.net/api";
  final Dio _dio = Dio();

  IllustrareService(){

  }

  Future<BaseResponse?> createProfile( CreateProfileModel model) async {
    try {
      Response response = await _dio.post(_endpoint + "createPr/", data: model.toJson());
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      // return ProductModel.withError("$error");
    }
  }
}