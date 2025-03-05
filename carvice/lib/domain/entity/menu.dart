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

  // Copy constructor
  Menu copyWith({
    String? coverImage,
    String? profileImage,
    LocalizedText? menuName,
    List<String>? foodImages,
    String? menuID,
    String? ownerID,
    bool? isPopular,
    Price? price,
    List<String>? reviewList,
    String? foodType,
    num? selectedPrice,
  }) {
    return Menu(
      coverImage: coverImage ?? this.coverImage,
      profileImage: profileImage ?? this.profileImage,
      menuName: menuName ?? this.menuName,
      foodImages: foodImages ?? List.from(this.foodImages),
      menuID: menuID ?? this.menuID,
      ownerID: ownerID ?? this.ownerID,
      price: price ?? this.price,
      reviewList: reviewList ?? List.from(this.reviewList),
      foodType: foodType ?? this.foodType,
      isPopular: isPopular ?? this.isPopular,
    );
  }
}

