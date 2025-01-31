
part of 'models.dart';

@JsonSerializable(createToJson: false)
class LocationResponse extends BaseResponse<Location>{
  final String? area;
  final String? block;
  final String? city;
  final String? code;
  final String? country;
  final String? district;
  @JsonKey(name: 'google')
  final String? googleMap;
  final String? house;
  final String? road;

  LocationResponse({
    this.area,
    this.block,
    this.city,
    this.code,
    this.country,
    this.district,
    this.googleMap,
    this.house,
    this.road,
  });
  factory LocationResponse.fromJson(Map<String, dynamic> json) => _$LocationResponseFromJson(json);

  @override
  Location toEntity() {
    return Location(
      area: area ?? '',
      block: block ?? '',
      city: city ?? '',
      code: code ?? '',
      country: country ?? '',
      district: district ?? '',
      googleMap: googleMap ?? '',
      house: house ?? '',
      road: road ?? '',
    );
  }
}