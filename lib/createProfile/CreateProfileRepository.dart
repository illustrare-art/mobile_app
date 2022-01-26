import 'package:illustrare/createProfile/CreateProfileModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:illustrare/network/IllustrareService.dart';

class CreateProfileRepository{
  IllustrareService _service = IllustrareService();

  Future<BaseResponse?> createProfile(CreateProfileModel model){
    return _service.createProfile(model);
  }
}