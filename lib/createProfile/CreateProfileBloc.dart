import 'package:illustrare/components/BaseBloc.dart';
import 'package:illustrare/createProfile/CreateProfileModel.dart';
import 'package:illustrare/createProfile/CreateProfileRepository.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:rxdart/rxdart.dart';

class CreateProfileBloc extends BaseBloc {

  CreateProfileBlo() {
    this.authRequired = true;
  }

  final CreateProfileRepository _repository = CreateProfileRepository();
  final BehaviorSubject<BaseResponse> _subject = BehaviorSubject<BaseResponse>();

  String? userId;
  String? userName;
  String? photoUrl;
  String? phoneNumber;

  createProfile() {
    if (userId != null && userName != null && photoUrl != null && phoneNumber!= null) {
      var model = CreateProfileModel(userId!, userName!, photoUrl!, phoneNumber!);
          _createProfile(model);
    }
  }
  _createProfile(CreateProfileModel model) async {
    BaseResponse? response = await _repository.createProfile(model);
    _subject.sink.add(response!);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<BaseResponse> get subject => _subject;

}
final bloc = CreateProfileBloc();