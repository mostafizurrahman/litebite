
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
  final OrderProcessStatus processStatus;
  final List<String> menus;
  final String orderID;
  final DateTime orderTime;
  final List<String> tables;
  final List<String> waiters;
  final String restaurantNumber;
  final String userID;
  final String customerNumber;

  RestaurantOrder({
    required this.processStatus,
    required this.menus,
    required this.orderID,
    required this.orderTime,
    required this.tables,
    required this.waiters,
    required this.restaurantNumber,
    required this.userID,
    required this.customerNumber,
  });

  Map<String, dynamic> toJsonMap() => {

  };

 }
