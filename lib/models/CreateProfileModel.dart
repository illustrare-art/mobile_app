import 'dart:ffi';

class CreateProfileModel {
  String username;
  String phoneNumber;
  String photoUrl;

  CreateProfileModel(this.username,  this.phoneNumber, this.photoUrl);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'username': username,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
    };
  }
// CreateProfileModel.withError(String s) {}
}
