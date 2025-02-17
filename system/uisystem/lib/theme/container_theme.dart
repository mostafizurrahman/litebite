
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
}