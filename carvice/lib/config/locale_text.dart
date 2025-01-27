
part of 'localization.dart';

final Map<String, Map<String, String>> _languageMap = {
  'en': _getEnglishMap(),
  'bn': _getBanglaMap(),
};

Map<String, String> _getEnglishMap() {
  return {
    'app_name' : 'LitBite',
  };
}

Map<String, String> _getBanglaMap() {
  return {
    'app_name': 'LitBite',
  };
}