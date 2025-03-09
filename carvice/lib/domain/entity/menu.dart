import '../../ui/home/restaurant/details/details_constant.dart';
import '../domain.dart';

enum DiscountType {
  percent,
  cashReduce,
  noDiscount,
}

extension StrDiscountType on DiscountType {
  String get value {
    if (this == DiscountType.cashReduce) {
      return 'cashReduce';
    }

    if (this == DiscountType.percent) {
      return 'percent';
    }
    return 'noDiscount';
  }
}

class Menu {
  final String coverImage;
  final String profileImage;
  final LocalizedText menuName;
  final List<String> foodImages;
  final DiscountType discountType;
  final num discount;
  final String menuID;
  final String ownerID;
  final bool isPopular;
  final Price price;
  final List<String> reviewList;
  final String foodType;
  Map<num, int> platterMap = {};

  bool get isFood => !this.foodType.contains(ResDetailsConstant.drink);

  Menu({
    required this.coverImage,
    required this.profileImage,
    required this.foodImages,
    required this.menuID,
    required this.ownerID,
    required this.price,
    required this.reviewList,
    required this.foodType,
    required this.discountType,
    required this.discount,
    required this.isPopular,
    required this.menuName,
  });

  bool setPlatter({
    required num price,
    final bool shouldRemove = false,
  }) {
    if (platterMap.containsKey(price)) {
      int count = platterMap[price]!;
      platterMap[price] = shouldRemove ? --count : ++count;
      if (count == 0) {
        platterMap.remove(price);
      }
    } else if (!shouldRemove) {
      platterMap.addEntries([MapEntry(price, 1)]);
    }
    return platterMap.isEmpty;
  }

  int get orderCount =>
      platterMap.values.reduce((sum, element) => sum + element);

  int get regularCount => platterMap[price.half] ?? 0;

  int get fullCount => platterMap[price.full] ?? 0;

  int get one3Count => platterMap[price.oneTo3] ?? 0;

  void clear() {
    platterMap.clear();
  }

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
      discountType: this.discountType,
      discount: this.discount,
    );
  }
}
