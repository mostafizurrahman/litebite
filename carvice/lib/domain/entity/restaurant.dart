import 'package:carvice/domain/entity/restaurant_order.dart';

import '../domain.dart';

class Restaurant {
  final String coverImage;
  final String profileImage;
  final LocalizedText description;
  final LocalizedText? history;
  final LocalizedText name;
  final List<Menu> menu;
  final String phoneNumber;
  final String? email;
  final String restaurantID;
  final List<Review> reviews;
  final List<Waiter> waiters;
  final Timing timing;
  final List<RestaurantOrder> orders;
  final String type;
  Restaurant({
    required this.coverImage,
    required this.profileImage,
    required this.description,
    required this.history,
    required this.menu,
    required this.name,
    required this.email,
    required this.restaurantID,
    required this.phoneNumber,
    required this.reviews,
    required this.waiters,
    required this.timing,
    required this.orders,
    required this.type,
  });
}

class Timing {
  final String openTime;
  final String closeTime;

  Timing({
    required this.closeTime,
    required this.openTime,
  });
}
