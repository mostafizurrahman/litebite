import '../domain.dart';

class OrderMenu {
  final String menuID;
  final num discount;
  final DiscountType discountType;
  final MenuCookingStatus cookingStatus;
  final DateTime time;
  final String tableID;
  final List<String> waiters;
  final MenuSize menuSize;

  OrderMenu({
    required this.time,
    required this.menuID,
    required this.discount,
    required this.tableID,
    required this.discountType,
    required this.cookingStatus,
    required this.waiters,
    required this.menuSize,
  });
}
