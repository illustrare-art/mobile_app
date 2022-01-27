import 'dart:ffi';

class AppUserModel {
  String userId;
  String? userName;
  String? photoUrl;
  String? phoneNumber;
  String? emailAddress;

  AppUserModel(this.userId, this.userName, this.photoUrl, this.phoneNumber, this.emailAddress);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'user_id': userId,
      'username': userName,
      'profile_photo': photoUrl,
      'phone_number': phoneNumber,
      "email":emailAddress
    };
  }
// CreateProfileModel.withError(String s) {}
}
