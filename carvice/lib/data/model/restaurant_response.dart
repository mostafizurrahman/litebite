


part of 'models.dart';
@JsonSerializable(createToJson: false)
class TimingResponse extends BaseResponse<Timing>{
  final String openTime;
  final String closeTime;

  TimingResponse({
    required this.closeTime,
    required this.openTime,
  });

  factory TimingResponse.fromJson(Map<String, dynamic> json) => _$TimingResponseFromJson(json);

  @override
  Timing toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}
@JsonSerializable(createToJson: false)
class RestaurantResponse extends BaseResponse<Restaurant>{
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
  factory RestaurantResponse.fromJson(Map<String, dynamic> json) => _$RestaurantResponseFromJson(json);

  @override
  Restaurant toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}