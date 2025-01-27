

import 'package:shared_preferences/shared_preferences.dart';

import 'app_constants.dart';
part 'locale_text.dart';
class Localization {
  String language = Constants.en;
  void _setLocale(String value) {
    language = value;
  }
  Localization(){
    _getLocale().then(_setLocale);
  }

  Future<void> changeLocale({required String lan}) async {
    _setLocale(lan);
    await _updatePreference();
  }

  Future<void> _updatePreference() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(Constants.lanKey, language);
  }

  Future<String> _getLocale() async {

    final pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.lanKey) ?? Constants.en;
  }
}

final localization = Localization();