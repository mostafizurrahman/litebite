


part of 'models.dart';

@JsonSerializable(createToJson: false)
class LocalizedResponse extends BaseResponse<LocalizedText> {
  final String? en;
  final String? bn;

  LocalizedResponse({required this.en, required this.bn});

  factory LocalizedResponse.fromJson(Map<String, dynamic> json) =>
      _$LocalizedResponseFromJson(json);

  Map<String, dynamic> toJson() => {};

  @override
  LocalizedText toEntity() => LocalizedText(
        english: en ?? 'english text missing',
        bangla: bn ?? 'bangla text missing',
      );
}