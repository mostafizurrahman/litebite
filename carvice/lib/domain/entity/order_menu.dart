
import 'table_data.dart';

class OrderMenu {
  final String menuID;
  final num quantity;
  final num menuPrice;
  final num discount;
  final DateTime time;
  final String tableID;
  OrderMenu({
    required this.time,
    required this.menuID,
    required this.quantity,
    required this.menuPrice,
    required this.discount,
    required this.tableID,
  });
}