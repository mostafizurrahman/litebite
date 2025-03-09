part of 'models.dart';

class DiscountConverter implements JsonConverter<DiscountType, String> {
  const DiscountConverter();

  @override
  DiscountType fromJson(String json) {
    return DiscountType.values.firstWhere(
      (e) => e.toString().split('.').last == json,
      orElse: () => DiscountType.noDiscount,
    );
  }

  @override
  String toJson(DiscountType object) => object.toString().split('.').last;
}

class MenuStatusConverter implements JsonConverter<MenuCookingStatus, String> {
  const MenuStatusConverter();

  @override
  MenuCookingStatus fromJson(String json) {
    return MenuCookingStatus.values.firstWhere(
      (e) => e.toString().split('.').last == json,
      orElse: () => MenuCookingStatus.menuPending,
    );
  }

  @override
  String toJson(MenuCookingStatus object) => object.toString().split('.').last;
}

@JsonSerializable(createToJson: true)
class MenuResponse extends BaseResponse<Menu> {
  @JsonKey(defaultValue: 0)
  final num discount;
  @DiscountConverter()
  @JsonKey(name: 'discount_type', defaultValue: DiscountType.noDiscount)
  final DiscountType discountType;
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
    required this.discountType,
    required this.discount,
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

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

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
      discount: discount,
      discountType: discountType,
    );
  }
}
