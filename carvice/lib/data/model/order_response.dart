part of 'models.dart';

@JsonSerializable(createToJson: false)
class OrderMenuResponse extends BaseResponse<OrderMenu> {
  @JsonKey(defaultValue: 0)
  final num discount;
  @JsonKey(defaultValue: 1)
  final num quantity;
  @JsonKey(name: 'unit_price', defaultValue: 0)
  final num menuPrice;
  @JsonKey(name: 'menu_id')
  final String menuID;

  @override
  OrderMenu toEntity() {
    return OrderMenu(
      menuID: menuID,
      quantity: quantity,
      menuPrice: menuPrice,
      discount: discount,
    );
  }

  OrderMenuResponse({
    required this.discount,
    required this.quantity,
    required this.menuPrice,
    required this.menuID,
  });
}

@JsonSerializable(createToJson: false)
class OrderResponse extends BaseResponse<Order> {
  @JsonKey(name: 'order_id')
  final String orderID;
  @JsonKey(name: 'table_list')
  final String tableList;
  @JsonKey(name: 'order_status')
  final String orderStatus;
  @JsonKey(name: 'user_list')
  final List<String> userList;
  @JsonKey(name: 'menu_list')
  final List<OrderMenuResponse> menuList;
  final String userID;
  final List<String> waiters;
  @JsonKey(name: 'order_time')
  final String orderTime;

  @override
  Order toEntity() {
    return Order();
  }

  OrderResponse({
    required this.orderID,
    required this.userID,
    required this.waiters,
    required this.orderTime,
    required this.menuList,
    required this.orderStatus,
    required this.tableList,
    required this.userList,
  });
}

@JsonSerializable(createToJson: false)
class OrderInfoResponse extends BaseResponse<Order> {
  @JsonKey(name: 'order_image')
  final String orderImage;
  @JsonKey(name: 'manager_id')
  final String managerID;
  @JsonKey(name: 'order_list')
  final List<OrderResponse> orderList;

  @override
  Order toEntity() {
    return Order();
  }

  OrderInfoResponse({
    required this.orderImage,
    required this.managerID,
    required this.orderList,
  });
}
