import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:illustrare/network/IllustrareService.dart';

class AddSinglePhotoRepository{
  IllustrareService _service = IllustrareService.instance;

  Future<BaseResponse> addSinglePhoto(SinglePhotoModel model){
    return _service.addSinglePhoto(model);
  }
}