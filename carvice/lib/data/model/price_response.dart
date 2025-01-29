
part of 'models.dart';

@JsonSerializable(createToJson: false)
class PriceResponse extends BaseResponse<Price>{
  final num full;
  final num half;
  @JsonKey(name: 'one_three')
  final num oneTo3;

  PriceResponse({
    required this.full,
    required this.half,
    required this.oneTo3,
  });
  factory PriceResponse.fromJson(Map<String, dynamic> json) => _$PriceResponseFromJson(json);

  @override
  Price toEntity() {
    // TODO: implement toEntity
    throw UnimplementedError();
  }
}