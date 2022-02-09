import 'package:firebase_auth/firebase_auth.dart';
import 'package:illustrare/auth/TokenManager.dart';
import 'package:illustrare/auth/UserManager.dart';
import 'package:illustrare/models/AppUserModel.dart';
import 'package:illustrare/models/TokenModel.dart';
import 'package:illustrare/network/GoogleSignInService.dart';
import 'package:illustrare/network/IllustrareService.dart';

class LoginRepository{
  GoogleSignInService _googleSignIn = GoogleSignInService.instance;
  IllustrareService _illustrareService = IllustrareService.instance;

  AppUserModel? getUser(){

    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) return AppUserModel(user.uid,null,user.photoURL,user.phoneNumber,user.email);
    else return null;
  }

  Future<TokenModel?> login() async {
    var credential = await _googleSignIn.signIn();
    if(credential == null || credential.accessToken == null) return null;
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) UserManager.instance.setUser(AppUserModel(user.uid,null,user.photoURL,user.phoneNumber,user.email));

    var model = TokenModel(accessToken:credential.accessToken!,idToken:credential.idToken!);
    var response = await _illustrareService.login(model);

    if(response.success){
      TokenManager.instance.setToken(model);
      return model;
    }
  }
}