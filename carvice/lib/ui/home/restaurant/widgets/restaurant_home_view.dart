

import 'package:carvice/ui/home/restaurant/widgets/rest_list_image_view.dart';
import 'package:carvice/ui/home/restaurant/widgets/restaurant_info_view.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/restaurant.dart';

class RestaurantHomeView extends StatelessWidget {
  final Restaurant restaurant;
  // final String imageUrl;
  // final String restaurantName;
  // final String openingTime;
  // final double rating;
  // final int ratingCount;
  // final String priceRange;

  const RestaurantHomeView({
    super.key,
    required this.restaurant,
    // required this.restaurantName,
    // required this.openingTime,
    // required this.rating,
    // required this.ratingCount,
    // required this.priceRange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestListImageView(restaurant: restaurant),
          RestaurantInfoView(restaurant: restaurant),
        ],
      ),
    );
  }
}
