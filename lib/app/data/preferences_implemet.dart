import 'package:shared_preferences/shared_preferences.dart';
import 'package:voleiatipico/app/data/data_interface.dart';

class PreferencesImplemet implements DataInterface {
  static SharedPreferences? _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception(
          'SharedPreferences not initialized. Call initialize() first.');
    }
    return _prefs!;
  }

  @override
  Future<void> deleteData(String key) async {
    prefs.remove(key);
  }

  @override
  Future<void> createData(String key, String value) async {
    prefs.setString(key, value);
  }

  @override
  Future<String?> getData(String key) async {
    final jsonString = prefs.getString(key);
    return jsonString;
  }

  @override
  Future<void> updateData(String key, String value) async {
    prefs.setString(key, value);
  }
}
