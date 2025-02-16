import 'order.dart';

class OrderInfo {
  final List<FoodOrder> orderList;
  final String orderImage;
  final String managerID;

  OrderInfo({
    required this.managerID,
    required this.orderList,
    required this.orderImage,
  });
}