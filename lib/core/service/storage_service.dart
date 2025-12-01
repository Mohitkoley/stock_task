import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String loginKey = "isLoggedIn";
  static const String phoneKey = "phone";
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveLogin(String phone) async {
    await _prefs?.setBool(loginKey, true);
    await _prefs?.setString(phoneKey, phone);
  }

  bool isLoggedIn() {
    return _prefs?.getBool(loginKey) ?? false;
  }

  String? getPhone() {
    return _prefs?.getString(phoneKey);
  }

  /// Log out user
  Future<void> logout() async {
    await _prefs?.clear();
  }
}
