import 'package:flutter/material.dart';

class UIBuilder {
  static double width({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double height({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
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
