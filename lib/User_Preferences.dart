
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async{
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> isLoggedIn() async {
    return  _preferences?.getBool('isLoggedIn') ?? false;
  }



  static Future<void> setLoggedIn(bool isLoggedIn) async{
    await _preferences?.setBool('isLoggedIn', isLoggedIn);
  }





}