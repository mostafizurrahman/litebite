


class TapData {
  final String? identifier;
  final int? tapIndex;
  final Map? meta;
  TapData({this.identifier, this.tapIndex, this.meta});
}

abstract class TapAction {
  void onTapWidget({required final TapData data});
  // void onLogPressTap() {
  //
  // }
}