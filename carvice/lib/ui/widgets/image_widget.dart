


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget {
  static Widget get svgWidget {
    return SvgPicture.asset(
      'lib/assets/foods/landing.svg',
      height: 120,
      width: 120,
    );
  }
}