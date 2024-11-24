
import 'dart:ui';

import 'package:flutter/material.dart';


//cars
class UIConstant  {
  static const double smallFS = 13;
  static const double regularFS = 14;
  static const double mediumFS = 16;
  static const double largeFS = 18;
  static const double buttonFS = 17;

  static const Color primary = Color(0xffcd1c18);
  static const Color texColor = Colors.black54;
  static const Color buttonBG = Colors.blueAccent;
  static const Color buttonTxt = Colors.white;
  static const Color shadowCL = Colors.grey;

  static const buttonTitleST = TextStyle(
    fontSize: UIConstant.buttonFS,
    color: UIConstant.buttonTxt,
  );

  static const hintStyle = TextStyle(
    fontSize: UIConstant.smallFS,
    color: UIConstant.shadowCL,
  );

  static const buttonSubtitleST = TextStyle(
    fontSize: UIConstant.regularFS,
    color: Colors.black87,
  );
}