import 'package:illustrare/models/AppUserModel.dart';

import '../../models/CreateProfileModel.dart';
import '../../network/BaseResponse.dart';
import '../../network/IllustrareService.dart';

class CreateProfileRepository{
  IllustrareService _service = IllustrareService();

  Future<BaseResponse> createProfile(CreateProfileModel model){
    return _service.createProfile(model);

  }

}