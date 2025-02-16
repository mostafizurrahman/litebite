import 'package:carvice/domain/domain.dart';

//customer single order with several food items
class FoodOrder {
  final String orderID;
  final TableData tableData;
  final String orderStatus;
  final String userID;
  final List<OrderMenu> menuList;
  final List<String> waiters;
  final DateTime orderTime;

  FoodOrder({
    required this.orderID,
    required this.tableData,
    required this.orderStatus,
    required this.userID,
    required this.menuList,
    required this.waiters,
    required this.orderTime,
  });
}
