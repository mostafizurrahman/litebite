
import 'package:flutter/material.dart';

class UIBuilder {
  static double width({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }


  static double height({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
}