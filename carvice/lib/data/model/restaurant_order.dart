

part of 'models.dart';

@JsonSerializable(createToJson: false)
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