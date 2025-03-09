

part of 'models.dart';


@JsonSerializable(createToJson: true)
class ReviewResponse extends BaseResponse<Review> {
  final num index;
  @JsonKey(name:'menu_id')
  final String menuID;
  @JsonKey(name:'profile_image')
  final String profileImage;
  @JsonKey(defaultValue: -1)
  final num rating;
  final String review;
  @JsonKey(name:'review_order')
  final num reviewOrder;
  @JsonKey(name:'review_type')
  final String reviewType;

  ReviewResponse({
    required this.index,
    required this.menuID,
    required this.profileImage,
    required this.rating,
    required this.review,
    required this.reviewOrder,
    required this.reviewType,
  });
  factory ReviewResponse.fromJson(Map<String, dynamic> json) => _$ReviewResponseFromJson(json);

  @override
  Review toEntity() {
    return Review(
      index: index,
      menuID: menuID,
      profileImage: profileImage,
      rating: rating,
      review: review,
      reviewOrder: reviewOrder,
      reviewType: reviewType,
    );
  }
}