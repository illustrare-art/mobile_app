import 'package:illustrare/models/TokenModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
I/flutter ( 4601): set-cookie: jwt_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Im9ndXp2dXJ1c2thbmVyQGdtYWlsLmNvbSIsImlhdCI6MTY0NDA5MDE5NywiZXhwIjoxNjQ2NzE4MTk3LCJqdGkiOiI0ZTk0YjA1OS04MTQwLTQzYmQtYjQyYy1mYmVjZGZjYmEyZDYiLCJ1c2VyX2lkIjoxLCJvcmlnX2lhdCI6MTY0NDA5MDE5N30.R9D42IPXs8QiWmjJqvpRvurIkYtnk_o4djMq__JBKqg; expires=Tue, 08 Mar 2022 05:43:18 GMT; HttpOnly; Max-Age=2628001; Path=/; SameSite=None; Secure
I/flutter ( 4601): date: Sat, 05 Feb 2022 19:43:18 GMT
I/flutter ( 4601): vary: Accept, Origin
I/flutter ( 4601): content-length: 17
I/flutter ( 4601): referrer-policy: same-origin
I/flutter ( 4601): ngrok-agent-ips: 24.133.86.35
I/flutter ( 4601): x-frame-options: DENY
I/flutter ( 4601): content-type: application/json
I/flutter ( 4601): x-content-type-options: nosniff
I/flutter ( 4601): allow: GET, HEAD, OPTIONS
I/flutter ( 4601): server: WSGIServer/0.2 CPython/3.8.6
 */

class TokenManager {
  static TokenManager? _instance;
  static TokenModel? _token;
  TokenManager._();

  static TokenManager get instance => _instance ??= TokenManager._();

  Future<void> setToken(TokenModel token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = token;
    prefs.setString("TOKEN_ACCESS_TOKEN",token.accessToken);
    prefs.setString("TOKEN_ID_TOKEN",token.idToken);

  }

  bool isLoggedIn(){
    return _token != null;
  }


  Future<TokenModel?> getToken() async {
    if(_token != null) return _token!;
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString("TOKEN_ACCESS_TOKEN");
      String? idToken = prefs.getString("TOKEN_ID_TOKEN");
      if(accessToken == null || idToken == null) return null;
      else return TokenModel(accessToken:accessToken,idToken:idToken);
    }
  }

}