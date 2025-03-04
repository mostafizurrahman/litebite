import '../domain.dart';

class Menu {
  final String coverImage;
  final String profileImage;
  final LocalizedText menuName;
  final List<String> foodImages;
  final String menuID;
  final String ownerID;
  final bool isPopular;
  final Price price;
  final List<String> reviewList;
  final String foodType;
  Map<num, int> platterMap = {};

  Menu({
    required this.coverImage,
    required this.profileImage,
    required this.foodImages,
    required this.menuID,
    required this.ownerID,
    required this.price,
    required this.reviewList,
    required this.foodType,
    required this.isPopular,
    required this.menuName,
  });

  void setPlatter({
    required num price,
    final bool shouldRemove = false,
  }) {
    if (platterMap.containsKey(price)) {
      int count = platterMap[price]!;
      platterMap[price] = shouldRemove ? --count : ++count;
      if (count == 0)  {
        platterMap.remove(price);
      }
    } else {
      platterMap.addEntries([MapEntry(price, 1)]);
    }
  }

  int get orderCount =>
      platterMap.values.reduce((sum, element) => sum + element);
}
