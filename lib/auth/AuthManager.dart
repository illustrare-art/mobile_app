import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {

    static String USER_ID_KEY = "current_user_id";

    Future<void> setUserId(String userId) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(USER_ID_KEY, userId);
    }

    Future<String?> getUserId() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(USER_ID_KEY);
    }

    Future<bool> isLoggedIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(USER_ID_KEY) != null ? true : false;
    }
}