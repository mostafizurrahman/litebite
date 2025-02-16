import 'order_menu.dart';

class FoodOrder {
  final String orderID;
  final List<String> tableList;
  final String orderStatus;
  final List<String> userList;
  final List<OrderMenu> menuList;
  final List<String> waiters;

  final String orderTime;

  FoodOrder({
    required this.orderID,
    required this.tableList,
    required this.orderStatus,
    required this.userList,
    required this.menuList,
    required this.waiters,
    required this.orderTime,
  });
}
