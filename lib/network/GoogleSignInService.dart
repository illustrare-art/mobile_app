
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInService{
  final GoogleSignIn _googleSignIn = GoogleSignIn();  //final BaseOptions _options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);

  Future<OAuthCredential?> signIn() async {
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
    return credential;


  }
}