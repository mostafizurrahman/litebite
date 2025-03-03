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
  num selectedPrice = 0.0;
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
}