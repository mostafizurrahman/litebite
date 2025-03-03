


import 'dart:ui';
import 'package:flutter/material.dart';

class DialogContentsView extends StatelessWidget {
  final Widget child;
  const DialogContentsView({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
            child: Container(
                color: Colors.black.withOpacity(0.2)), // Dark overlay
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // 50% height
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

