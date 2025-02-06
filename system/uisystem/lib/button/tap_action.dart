


class TapData {
  final String identifier;
  final int tapIndex;
  final Object meta;
  TapData({this.identifier = '', this.tapIndex = -1, required this.meta});
}

abstract class TapAction {
  void onTapWidget({required final TapData data});
  // void onLogPressTap() {
  //
  // }
}