import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  /// Static properties or methods are
  /// independent of objects or instances of
  /// a class. They can exist without having
  /// to create an instance of a class.
  ///
  /// Static methods also can be "async".
  ///
  /// Method has to be called before we render
  /// our first widget (MaterialApp). So this
  /// initialization has to happen in "main.dart".
  ///
  /// After implementing our static initializers concept
  /// we are now able to amend the properties of our
  /// SharedPreferences instance directly without redundant
  /// instantiation of captured objects.
  static init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  //TODO: Remove duplicate prefs initialization call
  /// Currently have a lot of duplicity since we are over
  /// and over again capturing a SharedPreferences instance
  /// in order to edit the properties of that instance.
  ///
  /// Here we define our private property as "late" variable
  /// because the initialization will happen later.
  /// Also add "static" because we can NOT have properties or
  /// methods tied to a class instance being used within our
  /// static method "init".
  static late final SharedPreferences _prefs;

  /// Why is the Future<void> and async combo necessary
  /// here?
  ///
  /// There is no "await" that I can tell. "set" method
  /// definitely is of Future type, but so are the "clear"
  /// and "get" methods.
  Future<void> loginUser(String userName) async {
    try {
      _prefs.setString('userName', userName);
    } catch (e) {
      print(e);
    }
  }

  void logoutUser() {
    _prefs.clear();
  }

  String? getUserName(){
    return  _prefs.getString('userName') ?? 'DefaultValue';
  }
}
