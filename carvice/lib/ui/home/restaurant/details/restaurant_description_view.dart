import 'package:flutter/cupertino.dart';

import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/theme/text_theme.dart';
import '../../../../domain/domain.dart';

class RestaurantDescriptionView extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDescriptionView({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height * 0.12;
    final fraction = width / 3.0;
    return Container(
      width: width,
      height: height,
      color: UIConstant.scaffoldBG,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            restaurant.description.txt,
            style: UITextTheme.tsTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: fraction,
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.fastfood,
                        color: UIConstant.primary,
                      ),
                      const SizedBox(height: 8),
                      Text(restaurant.type),
                    ],
                  ),
                ),
              ),
              Container(width: 1.5, height: height / 2, color: UIConstant.primary),
              Container(
                width: fraction - 3,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: UIConstant.primary,
                      ),
                      const SizedBox(height: 8),
                      Text('4.5'),
                    ],
                  ),
                ),
              ),
              Container(width: 1.5, height: height/2, color: UIConstant.primary),
              SizedBox(
                width: fraction,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Price Range', ),
                      const SizedBox(height: 8),
                      Text('150-450+'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
