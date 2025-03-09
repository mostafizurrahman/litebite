
part of 'models.dart';

@JsonSerializable(createToJson: true)
class PriceResponse extends BaseResponse<Price>{
  @JsonKey(defaultValue: 0)
  final num full;
  @JsonKey(defaultValue: 0)
  final num half;
  @JsonKey(name: 'one_three', defaultValue: 0)
  final num oneTo3;

  PriceResponse({
    required this.full,
    required this.half,
    required this.oneTo3,
  });
  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);

  @override
  Price toEntity() {
    return Price(full: full, half: half, oneTo3: oneTo3);
  }
}