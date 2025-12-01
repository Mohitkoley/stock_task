import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String loginKey = "isLoggedIn";
  static const String phoneKey = "phone";
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  SharedPreferences? _prefs;

  /// Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save login state
  Future<void> saveLogin(String phone) async {
    await _prefs?.setBool(loginKey, true);
    await _prefs?.setString(phoneKey, phone);
  }

  /// Check if user is logged in
  bool isLoggedIn() {
    return _prefs?.getBool(loginKey) ?? false;
  }

  /// Get saved phone number
  String? getPhone() {
    return _prefs?.getString(phoneKey);
  }

  /// Log out user
  Future<void> logout() async {
    await _prefs?.clear();
  }
}
