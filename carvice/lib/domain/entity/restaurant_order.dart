import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantOrder {
  final bool isProcessed;
  final List<String> menus;
  final String orderID;
  final DateTime orderTime;
  final List<String> tables;
  final List<String> waiters;
  final String restaurantNumber;
  final String userID;
  final String customerNumber;

  RestaurantOrder({
    required this.isProcessed,
    required this.menus,
    required this.orderID,
    required this.orderTime,
    required this.tables,
    required this.waiters,
    required this.restaurantNumber,
    required this.userID,
    required this.customerNumber,
  });
}
