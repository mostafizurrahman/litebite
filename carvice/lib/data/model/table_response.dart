
part of 'models.dart';

class TableResponse extends BaseResponse<MenuTable> {
  @JsonKey(name: 'pending_order_list')
  final List<String> orders;

  @JsonKey(name: 'table_id')
  final String tableID;
  @JsonKey(name: 'table_qr_url')
  final String tableQRUrl;
  @JsonKey(name: 'table_type', defaultValue: TableType.normal)
  final TableType tableType; //
  @JsonKey(name: 'table_type', defaultValue: [])
  final List<String> waiters; // id of the waiters assigned to the table
  @JsonKey(name: 'table_type', defaultValue: 0)
  final num index;
  @JsonKey(name: 'table_type', defaultValue: 0)
  final num chairs;

  TableResponse({
    required this.orders,
    required this.tableID,
    required this.tableQRUrl,
    required this.tableType,
    required this.waiters,
    required this.index,
    required this.chairs,
  });

  @override
  MenuTable toEntity() {
    return MenuTable(
      chairs: chairs,
      index: index,
      orders: orders,
      tableID: tableID,
      tableQRUrl: tableQRUrl,
      tableType: tableType,
      waiters: waiters,
    );
  }
}
