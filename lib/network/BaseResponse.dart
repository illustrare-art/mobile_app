import 'dart:ffi';

class BaseResponse {
  final bool success;
  final String? message;

  BaseResponse(this.success, this.message);

  @override
  String toString() {
    var responseMap = {
      "success":success,
      "message":message
    };
    return responseMap.toString();
  }

  // BaseResponse.withError(String errorValue)
  //     : results = List(),
  //       error = errorValue;
}