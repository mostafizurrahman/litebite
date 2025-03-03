

import 'dart:ui';

import 'package:flutter/material.dart';
class GradientBlurView extends StatelessWidget {

  final Widget child;
  GradientBlurView({required this.child});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        /// Background Gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.transparent],
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur strength
            child: Container(
              color: Colors.white.withOpacity(0.1), // Semi-transparent overlay
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}