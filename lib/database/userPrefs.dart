import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String _userKey = "user_data";

  /// Save user data as a JSON string in SharedPreferences
  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(userData);
    await prefs.setString(_userKey, userJson);
  }

  /// Retrieve user data as a Map
  static Future<Map<String, dynamic>?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  /// Retrieve user ID
  static Future<String?> getUserId() async {
    Map<String, dynamic>? userData = await getUserData();
    return userData?['id'];
  }

  /// Retrieve user name
  static Future<String?> getUserName() async {
    Map<String, dynamic>? userData = await getUserData();
    return userData?['name'];
  }

  /// Retrieve user email
  static Future<String?> getUserEmail() async {
    Map<String, dynamic>? userData = await getUserData();
    return userData?['email'];
  }

  /// Clear user data (Logout functionality)
  static Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
