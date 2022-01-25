import 'package:dio/dio.dart';
import 'package:illustrare/network/BaseRequest.dart';
import 'package:illustrare/network/BaseResponse.dart';

class IllustrareClient {
  final String _baseURL = "base url here";
  final Dio _dio = Dio();

  Future<BaseResponse> getRequest(String endPoint) async {
    try {
      String _endpoint = _baseURL + endPoint;
      Response response = await _dio.get(_endpoint);
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse.withError("$error");
    }
  }

  Future<BaseResponse> postRequest(String endPoint, BaseRequest request) async {
    try {
      String _endpoint = _baseURL + endPoint;
      Response response = await _dio.post(
        _endpoint,
        data: request.toJson()
      );
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseResponse.withError("$error");
    }
  }
}