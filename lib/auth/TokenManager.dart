import 'package:illustrare/models/TokenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static TokenManager? _instance;
  static TokenModel? _token;
  TokenManager._();

  static TokenManager get instance => _instance ??= TokenManager._();

  Future<void> setToken(TokenModel token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null){
      _token = token;
      prefs.setString("TOKEN_ACCESS_TOKEN",token.accessToken);

    }
  }

  bool isLoggedIn(){
    return _token != null;
  }


  Future<TokenModel?> getToken() async {
    if(_token != null) return _token!;
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString("TOKEN_ACCESS_TOKEN");
      if(accessToken == null) return null;
      else return TokenModel(accessToken);
    }
  }

}