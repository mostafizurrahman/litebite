


part of 'models.dart';

@JsonSerializable(createToJson: false)
class MenuResponse extends BaseResponse<Menu> {
  @JsonKey(name: 'cover_image', defaultValue: '')
  final String coverImage;
  @JsonKey(name: 'profile_image', defaultValue: '')
  final String profileImage;
  @JsonKey(name: 'food_images', defaultValue: [])
  final List<String> foodImages;
  final String id;
  @JsonKey(name: 'owner_id')
  final String ownerID;
  @JsonKey(name: 'popular', defaultValue: false)
  final bool isPopular;
  final PriceResponse price;
  @JsonKey(name: 'review_list')
  final List<String> reviewList;
  @JsonKey(name: 'type', defaultValue: '')
  final String foodType;
  final LocalizedResponse description;
  MenuResponse({
    required this.coverImage,
    required this.profileImage,
    required this.foodImages,
    required this.id,
    required this.ownerID,
    required this.price,
    required this.reviewList,
    required this.foodType,
    required this.isPopular,
    required this.description,
  });
  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);

  @override
  Menu toEntity() {
    return Menu(
      coverImage: coverImage,
      profileImage: profileImage,
      foodImages: foodImages,
      menuID: id,
      ownerID: ownerID,
      price: price.toEntity(),
      reviewList: reviewList,
      foodType: foodType,
      isPopular: isPopular,
      menuName: description.toEntity(),
    );
  }
}