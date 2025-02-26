import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier{
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> loginUser(String userName) async {
    try {
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  /// Here we will return a boolean value
  /// telling us whether the user is
  /// logged in or not.
  Future<bool> isLoggedIn() async{
    /// Need to await for the "username"
    /// to return value so have to setup
    /// method asynchronously.
    /// Ensures we have the data before we
    /// do our conditional check.
    String? username = await _prefs.getString('userName');
    /// If username is "null" we know its the
    /// first time the particular user is signing
    /// in.
    if(username == null) return false;
    return true;
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString('userName') ?? 'DefaultValue';
  }

  void updateUserName(String newName) {
    _prefs.setString('userName', newName);
    notifyListeners();
  }
}
