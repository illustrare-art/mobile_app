import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/network/GoogleSignInService.dart';

class LoginRepository{
  GoogleSignInService _googleSignIn = GoogleSignInService();

  Future<AppUserModel?> getUser(){
    return _googleSignIn.signIn();
  }
}