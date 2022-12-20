import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future saveUser(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedUser', username);
  }

  static Future<String?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loadedUser = prefs.getString('selectedUser');
    return loadedUser;
  }
}