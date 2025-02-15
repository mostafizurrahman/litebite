part of 'models.dart';

@JsonSerializable(createToJson: false)
class ConnectionResponse extends BaseResponse<Connection> {
  final int state;

  @JsonKey(name: 'user_id')
  final String userID;

  ConnectionResponse({required this.state, required this.userID});

  factory ConnectionResponse.fromJson(final Map<String, dynamic> json) =>
      _$ConnectionResponseFromJson(json);

  @override
  Connection toEntity() => Connection(userID: userID, status: state);
}

class EpicureResponse extends BaseResponse<Epicure> {
  final List<ConnectionResponse> connections;
  @JsonKey(name: 'cover_image', defaultValue: '')
  final String coverImage;
  @JsonKey(name: 'profile_image', defaultValue: '')
  final String profileImage;
  @JsonKey(name: 'date_subscription')
  final DateTime? dateSubscribed;
  final String email;
  final String mobile;
  final String name;
  @JsonKey(defaultValue: <Order>[])
  final List<Order> orders;
  @JsonKey(name: 'login_type', defaultValue: 'email')
  final String loginType;
  @JsonKey(defaultValue: false)
  final bool premium;
  final String profession;
  @JsonKey(name: 'user_id')
  final String userID;

  @override
  Epicure toEntity() => Epicure(
        userID: userID,
        connections: _toEntityList(connections),
        coverImage: coverImage,
        profileImage: profileImage,
        email: email,
        mobile: mobile,
        name: name,
        orders: orders,
        loginType: loginType,
        premium: premium,
        profession: profession,
      );

  EpicureResponse({
    required this.connections,
    required this.coverImage,
    required this.profileImage,
    this.dateSubscribed,
    required this.email,
    required this.mobile,
    required this.name,
    required this.orders,
    required this.loginType,
    required this.premium,
    required this.profession,
    required this.userID,
  });
}
