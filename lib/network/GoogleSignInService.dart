import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:illustrare/models/AppUserModel.dart';


class GoogleSignInService{
  final GoogleSignIn _googleSignIn = GoogleSignIn();  //final BaseOptions _options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);

  Future<AppUserModel?> signIn() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) return AppUserModel(user.uid,null,user.photoURL,user.phoneNumber,user.email);
    else return null;

  }
}