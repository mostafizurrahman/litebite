import 'package:flutter/material.dart';

class ContainerTheme {
  static const padding = EdgeInsets.symmetric(horizontal: 16);

  static BoxDecoration get shadowDec => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 0.254),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            spreadRadius: 2,
            blurRadius: 4,
            // changes position of shadow
          ),
        ],
      );

  static BoxDecoration get shadowMenu => BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.black.withOpacity(0.5), width: 0.254),
        borderRadius: BorderRadius.all(Radius.circular(7)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withAlpha(100),
            spreadRadius: 2,
            blurRadius: 8,
            // changes position of shadow
          ),
        ],
      );

  static BoxDecoration get linearDecoration => BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
  Colors.white,
  Colors.white.withAlpha(240),
  Colors.white.withAlpha(230),
  Colors.white.withAlpha(220),
  Colors.white.withAlpha(210),
  Colors.white.withAlpha(200),
  Colors.white.withAlpha(190),
  Colors.white.withAlpha(180),
  ], // Colorful background
  ),
  );


  static BoxDecoration get shadowDecCircle => shadowDec.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      );
}
