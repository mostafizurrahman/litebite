part of 'models.dart';

@JsonSerializable(createToJson: false)
class TimingResponse extends BaseResponse<Timing> {
  final String openTime;
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
  final String phoneNumber;
  final String? email;
  @JsonKey(name: 'restaurant_id')
  final String restaurantID;
  @JsonKey(name: 'review_list')
  final List<ReviewResponse> reviews;
  final List<String> waiters;
  final TimingResponse timing;

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
      waiters: waiters,
      timing: _toEntity(timing),
    );
  }
}
