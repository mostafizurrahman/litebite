

import 'package:carvice/config/app_constants.dart';
import 'package:carvice/config/localization.dart';

class LocalizedText {

  final String bangla;
  final String english;
  const LocalizedText({required this.bangla, required this.english});
  String get txt {
    if (localization.language == Constants.en) {
      return english;
    }
    return bangla;
  }
}