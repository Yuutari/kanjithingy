import 'package:shared_preferences/shared_preferences.dart';

/// Simple wrapper around `SharedPreferences` to centralize key names and
/// provide a small API for getting/setting primitive values.
class PreferencesService {
  static SharedPreferences? _prefs;

  // Keys
  static const String keyHiraganaSeen = 'hiragana_seen';
  static const String keyHiraganaSeenList = 'hiragana_seen_list';

  /// Must be called before using other methods. Usually from main() or
  /// before the first screen that uses preferences.
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  static Future<bool> setInt(String key, int value) async {
    if (_prefs == null) await init();
    return await _prefs!.setInt(key, value);
  }

  static String? getString(String key) => _prefs?.getString(key);
  static Future<bool> setString(String key, String value) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(key, value);
  }

  // String list helpers (useful for storing lists of characters marked seen)
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    if (_prefs == null) await init();
    return await _prefs!.setStringList(key, value);
  }

  /// Add an item to a stored string list (avoids duplicates)
  static Future<bool> addToStringList(String key, String item) async {
    if (_prefs == null) await init();
    final list = _prefs!.getStringList(key) ?? <String>[];
    if (!list.contains(item)) {
      list.add(item);
      return await _prefs!.setStringList(key, list);
    }
    return true;
  }

  /// Remove an item from a stored string list
  static Future<bool> removeFromStringList(String key, String item) async {
    if (_prefs == null) await init();
    final list = _prefs!.getStringList(key) ?? <String>[];
    if (list.contains(item)) {
      list.remove(item);
      return await _prefs!.setStringList(key, list);
    }
    return true;
  }

  static bool stringListContains(String key, String item) {
    final list = _prefs?.getStringList(key) ?? <String>[];
    return list.contains(item);
  }

  static Future<bool> remove(String key) async {
    if (_prefs == null) await init();
    return await _prefs!.remove(key);
  }
}
