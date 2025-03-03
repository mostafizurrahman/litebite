import 'dart:ui';

import 'package:flutter/material.dart';

class UIBuilder {
  static double width({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double height({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static void showFoodModalSheet({
    required BuildContext context,
    required Widget child,
    final double contentRatio = 0.5,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            // Blurred Background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(color: Colors.black.withOpacity(0.2)), // Dark overlay
              ),
            ),

            // Modal Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * contentRatio, // 50% height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child:  ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5, // 50% height
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ) ;
      },
    );
  }
}



extension MediaDimension on State<StatefulWidget> {
  double get width {
    return MediaQuery.of(context).size.width;
  }

  double get height {
    return MediaQuery.of(context).size.height;
  }

  double get top {
    return MediaQuery.of(context).padding.top;
  }

  double get bottom {
    return MediaQuery.of(context).padding.bottom;
  }
}
