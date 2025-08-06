import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey {
  login,
  password;

  String get title {
    switch (this) {
      case SharedPreferencesKey.login:
        return "login_key";
      case SharedPreferencesKey.password:
        return "password_key";
    }
  }
}

abstract class SharedPreferencesService {
  Future<bool> write(String value, SharedPreferencesKey key);
  Future<String?> read(SharedPreferencesKey key);
}

class SharedPreferencesServiceImpl implements SharedPreferencesService {

  @override
  Future<String?> read(SharedPreferencesKey key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.title);
  }

  @override
  Future<bool> write(String value, SharedPreferencesKey key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key.title, value);
  }
}
