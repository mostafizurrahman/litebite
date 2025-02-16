
part of 'bottom_tab_view.dart';

class _TabUIData {
  final IconData iconData;
  final int index;
  final String title;
  bool isSelected;
  final _tabController = StreamController<bool>();
  _TabUIData({
    required this.iconData,
    required this.index,
    required this.title,
    this.isSelected = false,
  });
}

List<_TabUIData> _getTabList() {
  final dir = "lib/assets/";
  final titles = ["Restaurants", "Favorite", "Scan ", "Top Chart", "OFFERS"];
  final icons = [
    Icons.restaurant,
    Icons.favorite,
    Icons.qr_code,
    Icons.area_chart,
    Icons.propane_rounded,
  ];
  final tabs = <_TabUIData>[];
  for (int i = 0; i < icons.length; i++) {
    final tab = _TabUIData(
      index: i,
      iconData: icons[i],
      title: titles[i],
      isSelected: i == 0,
    );
    tabs.add(tab);
  }
  return tabs;
}