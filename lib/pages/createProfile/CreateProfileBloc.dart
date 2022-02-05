import 'dart:developer';

import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/components/BaseBloc.dart';
import 'package:illustrare/models/AppUserModel.dart';
import '../../models/CreateProfileModel.dart';
import 'package:illustrare/pages/createProfile/CreateProfileRepository.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:rxdart/rxdart.dart';

class CreateProfileBloc extends BaseBloc {

  CreateProfileBloc() {
    this.authRequired = true;
  }

  final CreateProfileRepository _repository = CreateProfileRepository();
  final BehaviorSubject<BaseResponse> _subject = BehaviorSubject<BaseResponse>();

  var userName;
  var phoneNumber;
  var photoUrl;

  // TODO if server returns invalid username response
  // TODO show error dont change the screen
  _createProfile(CreateProfileModel model) async {
    BaseResponse? response = await _repository.createProfile(model);
    _subject.sink.add(response);
  }

  Future<AppUserModel> getUser() async {
    AppUserModel? user = await UserManager.instance.getUser();
    photoUrl = user?.photoUrl;
    return user!;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<BaseResponse> get subject => _subject;

  onCreateProfileClicked() {
    var model = CreateProfileModel(userName, phoneNumber,photoUrl);
    _createProfile(model);
  }

}
final bloc = CreateProfileBloc();