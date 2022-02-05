import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:illustrare/network/IllustrareService.dart';

class ProductRepository{
  IllustrareService _service = IllustrareService();

  Future<BaseResponse> addSinglePhoto(SinglePhotoModel model){
    return _service.addSinglePhoto(model);
  }
}