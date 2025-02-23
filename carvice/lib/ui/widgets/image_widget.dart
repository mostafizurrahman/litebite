


import 'dart:math';

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

  static Widget get defaultCoverImage {

    final rng = Random();
    final index = 1 + rng.nextInt(3);
    return Image.asset(
      'lib/assets/foods/cover-$index.jpg',
      fit: BoxFit.cover,

    );
  }
}