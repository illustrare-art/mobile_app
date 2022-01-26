import 'package:illustrare/createProfile/CreateProfileModel.dart';
import 'package:illustrare/product/ProductModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:dio/dio.dart';

class IllustrareService{
  final String _endpoint = "https://randomuser.me/api/";
  //final BaseOptions _options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
  final Dio _dio = Dio();

  Future<ProductModel?> getProduct(int productId) async {
    try {
      Response response = await _dio.get(_endpoint + "product/" + productId.toString());
      return ProductModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      // return ProductModel.withError("$error");
    }
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