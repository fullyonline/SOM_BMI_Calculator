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

  static Future saveUserList(List<String> users) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('Users', users);
  }

  static Future<List<String>?> loadUserList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loadedUsers = prefs.getStringList('Users');
    return loadedUsers;
  }
}