import 'package:shared_preferences/shared_preferences.dart';


/// We will use the "shared_preferences"
/// package to implement the concept of data
/// caching. Useful for simple data, do NOT use
/// for complex/critical data. For more complex
/// data use a local database like "sqflite".
///
/// "Caching" is where we store data locally
/// that prevents redundant information entry
/// by user. This kind of data is usually
/// handled via preferences in an app by the
/// user.
///
/// Things like storing login info so the user
/// doesn't have to enter their info everytime.
class AuthService {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async{
    //TODO: Implement login

    try {
      SharedPreferences sharedPrefs = await _prefs;
      sharedPrefs.setString('userName', userName);
    }

    catch(e){
      print(e);
    }
  }

  Future<void> logoutUser() async{
    //TODO: Implement logout
    SharedPreferences sharedPrefs = await _prefs;
    /// Clears all preferences in sharedPrefs
    /// when the user chooses to logout.
    sharedPrefs.clear();
  }

  /// We choose a return type of a
  /// null-able String object.
  Future<String?> getUserName() async {
    SharedPreferences sharedPrefs = await _prefs;
    /// Returns string "DefaultValue" if getString
    /// returns a null value.
    return sharedPrefs.getString('userName') ?? 'DefaultValue';
  }
}
