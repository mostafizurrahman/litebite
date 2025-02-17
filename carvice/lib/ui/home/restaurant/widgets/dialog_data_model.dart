

import 'package:flutter/material.dart';

// Enum for restaurant filter types
enum RestaurantFilterType {
  restaurant,
  nearby,
  chinese,
  thai,
  biriyani,
  pizza,
  burger,
  fast_Food,
}
abstract class SearchInterface {
  void onSelectedFilter(FoodResData data);
}
// Model class for food restaurant data
class FoodResData {
  final RestaurantFilterType type;
  final String title;
  bool isSelected;
  final IconData icon;

  FoodResData({
    required this.type,
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}

// Generate the data list dynamically
List<FoodResData> generateFoodDataList() {
  return RestaurantFilterType.values.map((type) {
    return FoodResData(
      type: type,
      title: type.name
          .replaceFirst(type.name[0], type.name[0].toUpperCase())
          .replaceAll('_', ' '),
      icon: _getIconForType(type),
    );
  }).toList();
}

// Assign relevant icons based on the filter type
IconData _getIconForType(RestaurantFilterType type) {
  switch (type) {
    case RestaurantFilterType.restaurant:
      return Icons.restaurant;
    case RestaurantFilterType.nearby:
      return Icons.near_me;
    case RestaurantFilterType.chinese:
      return Icons.rice_bowl;
    case RestaurantFilterType.thai:
      return Icons.local_dining;
    case RestaurantFilterType.biriyani:
      return Icons.set_meal;
    case RestaurantFilterType.pizza:
      return Icons.local_pizza;
    case RestaurantFilterType.burger:
      return Icons.lunch_dining;
    case RestaurantFilterType.fast_Food:
      return Icons.fastfood;
  }
}
final foodFilterList = generateFoodDataList();
