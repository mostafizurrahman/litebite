part of 'models.dart';

@JsonSerializable(createToJson: false)
class TimingResponse extends BaseResponse<Timing> {
  @JsonKey(name: 'open')
  final String openTime;
  @JsonKey(name: 'close')
  final String closeTime;

  TimingResponse({
    required this.closeTime,
    required this.openTime,
  });

  factory TimingResponse.fromJson(Map<String, dynamic> json) =>
      _$TimingResponseFromJson(json);

  @override
  Timing toEntity() {
    return Timing(closeTime: closeTime, openTime: openTime);
  }
}

@JsonSerializable(createToJson: false)
class WaiterResponse extends BaseResponse<Waiter> {
  final String id;
  final List<String> tables;
  final String name;

  WaiterResponse({
    required this.id,
    required this.tables,
    required this.name,
  });

  factory WaiterResponse.fromJson(Map<String, dynamic> json) =>
      _$WaiterResponseFromJson(json);

  @override
  Waiter toEntity() {
    return Waiter(name: name, waiterId: id, tables: tables);
  }
}

@JsonSerializable(createToJson: false)
class RestaurantResponse extends BaseResponse<Restaurant> {
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final LocalizedResponse description;
  final LocalizedResponse? history;
  final LocalizedResponse name;
  @JsonKey(name: 'menu')
  final List<MenuResponse> menuList;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? email;
  @JsonKey(name: 'restaurant_id')
  final String restaurantID;
  @JsonKey(name: 'review_list')
  final List<ReviewResponse> reviews;
  final List<WaiterResponse> waiters;
  final TimingResponse timing;
  @JsonKey(name: 'order', defaultValue: [])
  final List<RestaurantOrderResponse> orders;

  RestaurantResponse({
    required this.coverImage,
    required this.profileImage,
    required this.description,
    required this.history,
    required this.menuList,
    required this.name,
    required this.email,
    required this.restaurantID,
    required this.phoneNumber,
    required this.reviews,
    required this.waiters,
    required this.timing,
    required this.orders,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  @override
  Restaurant toEntity() {
    return Restaurant(
      coverImage: coverImage ?? '',
      profileImage: profileImage ?? '',
      description: _toEntity(description),
      history: history?.toEntity(),
      menu: _toEntityList(menuList),
      name: _toEntity(name),
      email: email,
      restaurantID: restaurantID,
      phoneNumber: phoneNumber,
      reviews: _toEntityList(reviews),
      waiters: _toEntityList(waiters),
      timing: _toEntity(timing),
      orders: _toEntityList(orders),
    );
  }
}
