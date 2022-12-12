import 'package:illustrare/components/BaseBloc.dart';
import 'package:illustrare/models/SinglePhotoModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:rxdart/rxdart.dart';

import 'AddSinglePhotoRepository.dart';

class AddPhotoBloc extends BaseBloc {

  AddPhotoBloc() {
    this.authRequired = true;
  }

  final AddSinglePhotoRepository _repository = AddSinglePhotoRepository();
  final BehaviorSubject<BaseResponse> _subject = BehaviorSubject<BaseResponse>();

  var name;
  var description;
  var userName;
  var phoneNumber;
  var photoUrl;

  // TODO if server returns invalid username response
  // TODO show error dont change the screen
  _createProfile(SinglePhotoModel model) async {
    BaseResponse? response = await _repository.addSinglePhoto(model);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<BaseResponse> get subject => _subject;


}
final bloc = AddPhotoBloc();