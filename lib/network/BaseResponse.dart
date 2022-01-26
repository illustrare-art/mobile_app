import 'dart:ffi';

class BaseResponse {
  final Bool success;
  final String message;

  BaseResponse(this.success, this.message);

  BaseResponse.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        message = json["message"];

  // BaseResponse.withError(String errorValue)
  //     : results = List(),
  //       error = errorValue;
}