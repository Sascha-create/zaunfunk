import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferencesAsync prefs = SharedPreferencesAsync();

  Future<void> saveLoggedIn() async {
    await prefs.setBool('loggedIn', true);
  }

  Future<void> getsavedLogin() async {
    await prefs.getBool('loggedIn');
  }
}
