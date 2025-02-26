import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier{
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static late final SharedPreferences _prefs;

  Future<void> loginUser(String userName) async {
    try {
      /// Adds a key value pair to our
      /// SharePreferences instance.
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString('userName') ?? 'DefaultValue';
  }

  /// States are NOT just read, they are also updated
  /// and listened to from time to time.
  ///
  /// The moment our "username" is updated in shared
  /// preferences, it should be instantly reflected
  /// in our UI where utilized.
  void updateUserName(String newName) {
    //TODO: Update sharedPrefs with new username
    _prefs.setString('userName', newName);
    /// Have to notify all the widgets (listeners)
    /// to update (rebuild themselves) for the userName
    /// change to be reflected.
    ///
    /// We do this via "notifyListeners()" and this is
    /// made possible by our "AuthService" class
    /// extending the class "ChangeNotifier".
    notifyListeners();
  }
}
