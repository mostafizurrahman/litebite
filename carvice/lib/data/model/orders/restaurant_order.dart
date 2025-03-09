

part of '../models.dart';

@JsonSerializable(createToJson: true)
class OrderMenuResponse extends BaseResponse<OrderMenu> {
  @JsonKey(defaultValue: 0)
  final num discount;
  @JsonKey(defaultValue: 1)
  final num quantity;
  @JsonKey(name: 'unit_price', defaultValue: 0)
  final num menuPrice;
  @JsonKey(name: 'menu_id')
  final String menuID;
  @TimestampConverter()
  final DateTime time;
  @JsonKey(name: 'table')
  final String tableID;

  @override
  OrderMenu toEntity() {
    return OrderMenu(
      menuID: menuID,
      quantity: quantity,
      menuPrice: menuPrice,
      discount: discount,
      time: time,
      tableID: tableID,
    );
  }

  OrderMenuResponse({
    required this.discount,
    required this.quantity,
    required this.menuPrice,
    required this.menuID,
    required this.time,
    required this.tableID,
  });

  factory OrderMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderMenuResponseFromJson(json);
}

@JsonSerializable(createToJson: true)
class TableDataResponse extends BaseResponse<TableData> {
  @JsonKey(name: 'table_id')
  final String tableID;
  @JsonKey(name: 'waiter_id')
  final String waiterID;
  @JsonKey(name: 'table_no')
  final num tableNo;

  TableDataResponse({
    required this.tableID,
    required this.tableNo,
    required this.waiterID,
  });

  @override
  TableData toEntity() => TableData(
    tableID: tableID,
    tableNo: tableNo,
    waiterID: waiterID,
  );

  factory TableDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TableDataResponseFromJson(json);
}

@JsonSerializable(createToJson: true)
class OrderResponse extends BaseResponse<FoodOrder> {
  @JsonKey(name: 'order_id')
  final String orderID;
  @JsonKey(name: 'table')
  final TableDataResponse tableData;
  @JsonKey(name: 'order_status')
  final String orderStatus;
  @JsonKey(name: 'user_id')
  final String userID;
  @JsonKey(name: 'foods')
  final List<OrderMenuResponse> menuList;

  final List<String> waiters;
  @TimestampConverter()
  @JsonKey(name: 'order_time')
  final DateTime orderTime;

  @override
  FoodOrder toEntity() {
    return FoodOrder(
      orderID: orderID,
      menuList: _toEntityList(menuList),
      orderStatus: orderStatus,
      orderTime: orderTime,
      tableData: _toEntity(tableData),
      userID: userID,
      waiters: waiters,
    );
  }

  OrderResponse({
    required this.orderID,
    required this.waiters,
    required this.orderTime,
    required this.menuList,
    required this.orderStatus,
    required this.tableData,
    required this.userID,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}

@JsonSerializable(createToJson: true)
class OrderInfoResponse extends BaseResponse<OrderInfo> {
  @JsonKey(name: 'order_image')
  final String orderImage;
  @JsonKey(name: 'manager_id')
  final String managerID;
  @JsonKey(name: 'order_list', defaultValue: [])
  final List<OrderResponse> orderList;

  @override
  OrderInfo toEntity() {
    return OrderInfo(
      managerID: this.managerID,
      orderImage: this.orderImage,
      orderList: _toEntityList(orderList),
    );
  }

  OrderInfoResponse({
    required this.orderImage,
    required this.managerID,
    required this.orderList,
  });

  factory OrderInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: true)
class RestaurantOrderResponse extends BaseResponse<RestaurantOrder> {

  @JsonKey(name: 'is_processed')
  final bool isProcessed;
  final List<String> menus;
  @JsonKey(name: 'order_id')
  final String orderID;
  @TimestampConverter()
  @JsonKey(name: 'order_time')
  final DateTime orderTime;
  final List<String> tables;
  final List<String> waiters;
  @JsonKey(name: 'customer_contact')
  final String customerNumber;
  @JsonKey(name: 'user_id')
  final String userID;
  @JsonKey(name: 'restaurant_contact')
  final String restaurantNumber;


  factory RestaurantOrderResponse.fromJson(Map<String, dynamic> json) => _$RestaurantOrderResponseFromJson(json);

  RestaurantOrderResponse({
    required this.isProcessed,
    required this.menus,
    required this.orderID,
    required this.orderTime,
    required this.tables,
    required this.waiters,
    required this.customerNumber,
    required this.restaurantNumber,
    required this.userID
  });

  @override
  RestaurantOrder toEntity() => RestaurantOrder(
    tables: tables,
    waiters: waiters,
    orderTime: orderTime,
    orderID: orderID,
    isProcessed: isProcessed,
    menus: menus,
    restaurantNumber: restaurantNumber,
    customerNumber: customerNumber,
    userID: userID,
  );
}