import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/components/BaseBloc.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/network/BaseResponse.dart';
import 'package:illustrare/pages/createProfile/CreateProfileRepository.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/CreateProfileModel.dart';

class CreateProfileBloc extends BaseBloc {
  CreateProfileBloc() {
    this.authRequired = true;
  }

  final CreateProfileRepository _repository = CreateProfileRepository();
  final BehaviorSubject<BaseResponse> _subject =
      BehaviorSubject<BaseResponse>();

  var userName;
  var phoneNumber;
  var photoUrl;

  _createProfile(CreateProfileModel model) async {
    BaseResponse? response = await _repository.createProfile(model);
    _subject.sink.add(response);
  }

  Future<AppUserModel?> getUser() async {
    AppUserModel? user = await UserManager.instance.getUser();
    return user;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<BaseResponse> get subject => _subject;

  onCreateProfileClicked() async {
    var photo = await _fetchPhoto();

    var model = CreateProfileModel(username:userName, photo:photo);
    _createProfile(model);
  }

  Future<File> pickPhoto() async {
    final ImagePicker _picker = ImagePicker();
    var selectedImage = await _picker.pickImage(
        maxWidth: 640, maxHeight: 640, source: ImageSource.gallery);
    var photo = File(selectedImage!.path);
    photoUrl = File(photo.path);
    return photoUrl;
  }

  Future<File?> _fetchPhoto() async {
    File imageFile;
    if (photoUrl.runtimeType is File || photoUrl.runtimeType.toString() == "_File") {
      imageFile = photoUrl;
    } else if (photoUrl.runtimeType == String) {
      final response = await http.get(Uri.parse(photoUrl));
      final documentDirectory = await getApplicationDocumentsDirectory();

      imageFile = File(p.join(documentDirectory.path, "image.png"));
      photoUrl = await imageFile.writeAsBytes(response.bodyBytes);

    } else {

      return null;
    }
    return imageFile;
  }
}

final bloc = CreateProfileBloc();
