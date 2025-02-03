import 'order.dart';

class OrderInfo {
  final List<Order> orderList;
  final String orderImage;
  final String managerID;

  OrderInfo({
    required this.managerID,
    required this.orderList,
    required this.orderImage,
  });
}