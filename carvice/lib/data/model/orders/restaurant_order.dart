part of '../models.dart';

@JsonSerializable(createToJson: true)
class MenuSizeResponse extends BaseResponse<MenuSize> {
  @JsonKey(name: 'full', defaultValue: 0)
  final num full;
  @JsonKey(name: 'half', defaultValue: 0)
  final num half;
  @JsonKey(name: 'one_to_three', defaultValue: 0)
  final num oneToThree;

  MenuSizeResponse({
    required this.full,
    required this.half,
    required this.oneToThree,
  });

  @override
  MenuSize toEntity() => MenuSize(
        full: full,
        half: half,
        oneToThree: oneToThree,
      );
  factory MenuSizeResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuSizeResponseFromJson(json);
}

@JsonSerializable(createToJson: true)
class OrderMenuResponse extends BaseResponse<OrderMenu> {
  @JsonKey(defaultValue: 0)
  final num discount;
  @DiscountConverter()
  @JsonKey(name: 'discount_type', defaultValue: DiscountType.noDiscount)
  final DiscountType discountType;

  @MenuStatusConverter()
  @JsonKey(name: 'menu_status', defaultValue: MenuCookingStatus.menuPending)
  final MenuCookingStatus menuCookingStatus;

  @JsonKey(name: 'menu_id')
  final String menuID;
  @TimestampConverter()
  @JsonKey(name: 'menu_time')
  final DateTime time;
  @JsonKey(name: 'table_id')
  final String tableID;
  @JsonKey(name: 'platter_size')
  final MenuSizeResponse platterSize;
  final List<String> waiters;

  @override
  OrderMenu toEntity() {
    return OrderMenu(
      menuID: menuID,
      discount: discount,
      time: time,
      tableID: tableID,
      discountType: discountType,
      waiters: waiters,
      cookingStatus: menuCookingStatus,
      menuSize: _toEntity(platterSize),
    );
  }

  OrderMenuResponse({
    required this.discount,
    required this.menuID,
    required this.time,
    required this.tableID,
    required this.menuCookingStatus,
    required this.waiters,
    required this.discountType,
    required this.platterSize,
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
class RestaurantOrderResponse extends BaseResponse<RestaurantOrder> {
  @OrderStatusConverter()
  @JsonKey(name: 'order_status')
  final OrderProcessStatus orderStatus;
  @JsonKey(name: 'menu_list')
  final List<OrderMenuResponse> menus;
  @TimestampConverter()
  @JsonKey(name: 'order_time')
  final DateTime orderTime;
  @JsonKey(name: 'table_list')
  final List<String> tables;

  final List<String> waiters;
  @JsonKey(name: 'customer_contact')
  final String customerNumber;
  @JsonKey(name: 'user_list') // multiple user may add menu same order-id
  final List<String> userList;
  @JsonKey(name: 'order_contact')
  final String restaurantNumber;

  factory RestaurantOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantOrderResponseFromJson(json);

  RestaurantOrderResponse({
    required this.menus,
    required this.tables,
    required this.waiters,
    required this.userList,
    required this.orderTime,
    required this.orderStatus,
    required this.customerNumber,
    required this.restaurantNumber,
  });

  @override
  RestaurantOrder toEntity() => RestaurantOrder(
        tables: tables,
        waiters: waiters,
        userList: userList,
        orderTime: orderTime,
        processStatus: orderStatus,
        menus: _toEntityList(menus),
        customerNumber: customerNumber,
        restaurantNumber: restaurantNumber,
      );
}
