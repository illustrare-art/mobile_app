import 'package:illustrare/models/AppUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static UserManager? _instance;
  static AppUserModel? _user;

  UserManager._();

  static UserManager get instance => _instance ??= UserManager._();

  Future<void> setUser(AppUserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null){
      _user = user;
      prefs.setString("USER_UID",user.userId);
      if(user.userName != null) prefs.setString("USER_USERNAME",user.userName!);
      if(user.photoUrl != null) prefs.setString("USER_PHOTO_URL",user.photoUrl!);
      if(user.phoneNumber != null) prefs.setString("USER_PHONE_NUMBER",user.phoneNumber!);
      if(user.emailAddress != null) prefs.setString("USER_EMAIL",user.emailAddress!);

    }
  }


  Future<AppUserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(_user != null) return _user!;
    else{
      String? userId = prefs.getString("USER_UID");
      if(userId == null) return null;
      else return AppUserModel(prefs.getString("USER_UID")!, prefs.getString("USER_USERNAME"), prefs.getString("USER_PHOTO_URL"), prefs.getString("USER_PHONE_NUMBER"), prefs.getString("USER_EMAIL"));
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("USER_UID") != null ? true : false;
  }
}