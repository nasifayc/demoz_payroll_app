import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LoginManager {
  static const String _userKey = 'user';

  static Future<void> saveUser(String id) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, id);
    } catch (e) {
      log('Error saving user: $e');
    }
  }

  static Future<String?> getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userId = prefs.getString(_userKey);
      return userId;
    } catch (e) {
      log('Error retrieving user: $e');
    }
    return null;
  }

  static Future<void> deleteUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      log('Error deleting user: $e');
    }
  }
}
