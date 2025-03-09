import 'order_menu.dart';

enum OrderProcessStatus {
  requested, // request from user to restaurant
  confirmed, // confirmed by waiter to customer
  receiptGenerated,
}

extension ExtOrderProcessStatus on OrderProcessStatus {
  String get value {
    return this.toString().split('.').last;
  }
}

class RestaurantOrder {
  final DateTime orderTime;
  final List<String> tables;
  final List<String> waiters;
  final List<OrderMenu> menus;
  final List<String> userList;
  final String customerNumber;
  final String restaurantNumber;
  final OrderProcessStatus processStatus;

  RestaurantOrder({
    required this.menus,
    required this.tables,
    required this.waiters,
    required this.userList,
    required this.orderTime,
    required this.processStatus,
    required this.customerNumber,
    required this.restaurantNumber,
  });

  Map<String, dynamic> toJsonMap() => {};
}
