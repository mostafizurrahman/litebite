import 'package:carvice/domain/domain.dart';

//customer single order with several food items
class FoodOrder {
  final String orderID;
  final TableData tableData;
  final String orderStatus;
  final List<String> userList;
  final List<OrderMenu> menuList;
  final List<String> waiters;
  final DateTime orderTime;

  FoodOrder({
    required this.orderID,
    required this.tableData,
    required this.orderStatus,
    required this.userList,
    required this.menuList,
    required this.waiters,
    required this.orderTime,
  });
}
