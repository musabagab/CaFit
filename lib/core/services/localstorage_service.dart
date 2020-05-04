import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  static const String LoggedInKey = 'loggedIn';

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  bool _getFromDisk(String key) {
    var value = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void _saveToDisk(String key, bool content) {
    print(
        '(TRACE) LocalStorageService:_saveBoolToDisk. key: $key value: $content');
    _preferences.setBool(key, content);
  }

  bool get hasLoggedIn => _getFromDisk(LoggedInKey) ?? false;
  set hasLoggedIn(bool value) => _saveToDisk(LoggedInKey, value);
}
