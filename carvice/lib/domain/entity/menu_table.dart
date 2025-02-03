enum TableType {
  vip, normal, cabin
}

class MenuTable {
  final List<String> orders;
  final String tableID;
  final String tableQRUrl;
  final TableType tableType; //
  final List<String> waiters; // id of the waiters assigned to the table
  final num index;
  final num chairs;

  MenuTable({
    required this.orders,
    required this.tableID,
    required this.tableQRUrl,
    required this.tableType,
    required this.waiters,
    required this.index,
    required this.chairs,
  });
}