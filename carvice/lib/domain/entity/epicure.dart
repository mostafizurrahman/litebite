import 'order.dart';

class Connection {
  final int status;
  final String userID;

  Connection({required this.userID, required this.status});
}

class Epicure {
  final List<Connection> connections;
  final String coverImage;
  final String profileImage;
  final DateTime? dateSubscribed;
  final String email;
  final String mobile;
  final String name;
  final List<FoodOrder> orders;
  final String loginType;
  final bool premium;
  final String profession;
  final String userID;

  Epicure({
    required this.userID,
    required this.connections,
    required this.coverImage,
    required this.profileImage,
    required this.email,
    required this.mobile,
    required this.name,
    required this.orders,
    required this.loginType,
    required this.premium,
    required this.profession,
    this.dateSubscribed,
  });
}
