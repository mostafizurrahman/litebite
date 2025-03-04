import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';

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

  static BoxDecoration get shadowLine => BoxDecoration(
        color: UIConstant.iconSelected,
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.254),
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
            Colors.white.withOpacity(1),   // Fully opaque (255)
            Colors.white.withOpacity(0.95), // 230
            Colors.white.withOpacity(0.9), // 204
            Colors.white.withOpacity(0.85), // 179
            Colors.white.withOpacity(0.8), // 153
            Colors.white.withOpacity(0.75), // 128
            Colors.white.withOpacity(0.7), // 77
            Colors.white.withOpacity(0.65),
            // Colors.white.withOpacity(0.5),   // Fully opaque (255)
            // Colors.white.withOpacity(0.45), // 230
            // Colors.white.withOpacity(0.4), // 204
            // Colors.white.withOpacity(0.35), // 179
            // Colors.white.withOpacity(0.25), // 153
            // Colors.white.withOpacity(0.2), // 128
            // Colors.white.withOpacity(0.1), // 77
            // Colors.white.withOpacity(0),
          ], // Colorful background
        ),
      );

  static BoxDecoration get shadowDecCircle => shadowDec.copyWith(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      );
}
