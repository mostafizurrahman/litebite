

import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

class RestaurantInfoView extends StatelessWidget {

  final Restaurant restaurant;
  const RestaurantInfoView({super.key, required this.restaurant});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return // Restaurant Info
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name.txt,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(restaurant.timing.openTime, style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 12),
                const Icon(Icons.attach_money, size: 16, color: Colors.grey),
                Text("\$\$", style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      );
  }
}