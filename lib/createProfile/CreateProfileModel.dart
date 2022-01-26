import 'dart:ffi';

class CreateProfileModel {
  String userId;
  String userName;
  String photoUrl;
  String phoneNumber;

  CreateProfileModel(this.userId, this.userName, this.photoUrl, this.phoneNumber);

  Map<String, dynamic> toJson(){
    return <String, dynamic> {
      'user_id': userId,
      'username': userName,
      'profile_photo': photoUrl,
      'phone_number': phoneNumber,
    };
  }
// CreateProfileModel.withError(String s) {}
}
