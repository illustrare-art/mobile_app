import 'dart:typed_data';

class CreateProfileModel {
  String? username;
  String? phoneNumber;
  List<int>? photoUrl;

  CreateProfileModel(this.username,  this.phoneNumber, this.photoUrl);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'username': username,
      'phone_number': phoneNumber,
      'profile_photo': photoUrl,
    };
  }
// CreateProfileModel.withError(String s) {}
}
