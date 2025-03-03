import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:uisystem/button/tap_widget.dart';
import 'package:uisystem/theme/constants.dart';
import '../../../../domain/domain.dart';
import 'details_constant.dart';

class RestaurantDescriptionView extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDescriptionView({required this.restaurant});

  @override
  State<RestaurantDescriptionView> createState() =>
      _RestaurantDescriptionViewState();
}

class _RestaurantDescriptionViewState extends State<RestaurantDescriptionView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height *
        ResDetailsConstant.descriptionRatio;
    final fraction = height - 8;
    return Container(
      width: width,
      height: height,
      color: UIConstant.scaffoldBG,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TapWidget(
            iconData: Icons.fastfood,
            iconColor: UIConstant.iconSelected,
            cornerRadius: width * 0.25,
            onTapWidget: _onTapType,
            background: Colors.black54,
            width: fraction ,
            height: fraction ,
            title: widget.restaurant.type,
            isVertical: true,
            textColor: UIConstant.buttonTxt,
          ),
          Container(
            width: 1.5,
            height: height / 2,
            color: UIConstant.primary,
          ),
          TapWidget(
            iconData: Icons.star,
            iconColor: Colors.yellow,
            cornerRadius: width * 0.25,
            onTapWidget: _onTapRating,
            background: Colors.black54,
            width: fraction ,
            height: fraction ,
            title: '4.5',
            isVertical: true,
            textColor: UIConstant.buttonTxt,
          ),
          Container(
            width: 1.5,
            height: height / 2,
            color: UIConstant.primary,
          ),
          TapWidget(
            cornerRadius: width * 0.25,
            onTapWidget: _onTapPriceRange,
            background: Colors.black54,
            width: fraction ,
            height: fraction ,
            title: 'BDT',
            subtitle: '150-450+',
            isVertical: true,
            textColor: UIConstant.buttonTxt,
            subTitleColor: UIConstant.buttonTxt,
          ),
        ],
      ),
    );
  }

  void _onTapType() {}

  void _onTapRating() {}

  void _onTapPriceRange() {}
}
