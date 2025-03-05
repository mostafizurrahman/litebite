import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';

class UITextTheme {
  static const tsAppBar = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const tsTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const ts16Colored = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: UIConstant.primary,
  );
  static const colorTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: UIConstant.primary,
  );
  static const selected14Title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: UIConstant.iconSelected,
  );

  static const bold22Title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: UIConstant.texColor,
  );

  static const bold22Colored = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: UIConstant.primary,
  );


  static const hintTxt = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
  static const italic12Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    color: Colors.black87
  );
  static const tsTitleL = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static const tsNormal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const ts13Subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  static const ts14White = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const ts12White = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static const ts14Black = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const ts13WhiteSub = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: Colors.white,
  );
}
