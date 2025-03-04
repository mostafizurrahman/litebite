import 'package:carvice/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

class RestaurantView extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantView({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Material(
        child: Container(
          width: double.maxFinite,
          decoration: ContainerTheme.shadowDec,
          height: 230,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text(restaurant.name.txt)),
                  Image.network(restaurant.profileImage),
                ],
              ),
              Expanded(child: Text(restaurant.description.txt)),
            ],
          ),
        ),
      ),
    );
  }
}
