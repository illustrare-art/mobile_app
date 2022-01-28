import 'dart:ffi';

class CreateProfileModel {
  String username;
  String phoneNumber;

  CreateProfileModel(this.username,  this.phoneNumber);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'username': username,
      'phone_number': phoneNumber,
    };
  }
// CreateProfileModel.withError(String s) {}
}
