import 'package:shared_preferences/shared_preferences.dart';

class AppSharedStorage {
  static final AppSharedStorage _instance = AppSharedStorage._internal();

  factory AppSharedStorage() {
    return _instance;
  }

  AppSharedStorage._internal();

  SharedPreferences? _preferences;

  Future<SharedPreferences> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  // insert
  Future<void> insert(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // get
  String? get(String key) => _preferences?.getString(key);

  // delete
  Future<void> delete(String key) async {
    await _preferences?.remove(key);
  }
}
