import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static late SharedPreferences sharedpref;
  static Future cacheIntialization() async {
    sharedpref = await SharedPreferences.getInstance();
  }

 static Future<bool> insertCache({required String key, required String value}) async {
    return await sharedpref.setString(key, value);
  }

 static String getCache({required String key}) {
    return sharedpref.getString(key) ?? "";
  }

 static Future<bool> deleteCache({required String Key}) async {
    return await sharedpref.remove(Key);
  }
}
