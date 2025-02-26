
import 'dart:ui';

import 'package:flutter/material.dart';


//cars
class UIConstant  {
  static const double smallFS = 13;
  static const double regularFS = 14;
  static const double mediumFS = 16;
  static const double largeFS = 18;
  static const double buttonFS = 17;

  static const Color  splashColor = Colors.amber;
  static const Color focusColor = Colors.redAccent;
  static const Color primary = Color(0xffE53935);
  static const Color amber = Colors.amber;
  // static const Color primary = Color(0xff0d76A8);
  static const Color iconSelected = Color(0xff3dDD58);
  static const Color texColor = Color(0xff3d3c48);
  static const Color titleColor = Colors.black54;
  static const Color buttonBG = Colors.blueAccent;
  static const Color buttonTxt = Colors.white;
  static const Color scaffoldBG = Color(0xffEdEcE8);
  static const Color shadowCL = Colors.grey;
  static TextStyle get shadowStyle => TextStyle(
    fontSize: 42, // Adjust font size
    fontWeight: FontWeight.bold, // Make text bold
    color: Colors.white, // Primary text color
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.9), // Deeper shadow
        blurRadius: 10,  // More spread
        offset: Offset(3, 3), // Bigger offset
      ),
      Shadow(
        color: Colors.black.withOpacity(0.5), // Extra layer for depth
        blurRadius: 12,
        offset: Offset(5, 5),
      ),
    ],
  );
  static const buttonTitleST = TextStyle(
    fontSize: UIConstant.buttonFS,
    color: UIConstant.buttonTxt,
  );

  static const titleST = TextStyle(
    fontSize: UIConstant.largeFS,
    color: UIConstant.titleColor,
    fontWeight: FontWeight.bold,
  );


  static const labelText = TextStyle(
    fontSize: UIConstant.regularFS,
    color: UIConstant.texColor,
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