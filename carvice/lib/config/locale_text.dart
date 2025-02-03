
part of 'localization.dart';

final Map<String, Map<String, String>> _languageMap = {
  'en': _getEnglishMap(),
  'bn': _getBanglaMap(),
};

Map<String, String> _getEnglishMap() {
  return {
    'app_name' : 'LitBite',
    "title_landing": "🔥 Discover. Taste. Share. 🍽️",
    "subtitle_landing": "Join LitBite – Where Every Bite is an Experience!"
  };
}

Map<String, String> _getBanglaMap() {
  return {
    'app_name': 'LitBite',
    "title_landing": "🔥 অসাধারণ সব খাবারের খোঁজে 🍽️",
    "subtitle_landing": "LitBite-এ যোগ দিন – যেখানে প্রতিটি খাবারই এক অনন্য অভিজ্ঞতা!"
  };
}