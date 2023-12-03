part of 'local.dart';

class SharedPrefService {
  late final SharedPreferences _prefs;

  SharedPrefService();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void delete(String key) => _prefs.remove(key);

  String? get token => _prefs.getString(SharedPrefsKey.token);

  Future<bool> setCurrentToken(String token) async {
    return _prefs.setString(SharedPrefsKey.token, token);
  }

  Future<bool> removeCurrentToken() async {
    return _prefs.remove('token');
  }

  Future<bool> setLanguage(String value) async {
    return _prefs.setString(SharedPrefsKey.languageCode, value);
  }

  String get language => _prefs.getString(SharedPrefsKey.languageCode) ?? 'en';
}
