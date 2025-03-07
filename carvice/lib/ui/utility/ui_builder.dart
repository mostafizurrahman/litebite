import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../domain/domain.dart';

extension ListUtils<T> on List<T> {
  num sumBy(num f(T element)) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }
}

extension MenuExt on Menu {
  num get totalPrice {
    return platterMap.entries
        .fold(0, (sum, entry) => sum + (entry.key * entry.value));
  }
}

extension OrderList on List<Menu> {
  num get totalPrice => this.fold(0, (sum, menu) => sum + menu.totalPrice);

  int get foodCount {
    final orders = this.where(_isFoodType).toList();
    return orders.sumBy((menu) => menu.orderCount).toInt();
  }

  int get drinkCount => this.where(_isNotFoodType).length;

  bool _isFoodType(final Menu menu) => menu.isFood;

  bool _isNotFoodType(final Menu menu) => !menu.isFood;
}

extension NullList on List? {
  bool get isNonNullEmpty => this != null && this!.isNotEmpty;
}

class UIBuilder {
  static double width({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  static double height({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static Widget getPlusMinus(
    final IconData iconData,
    VoidCallback? onTapIcon, {
    Color iconColor = UIConstant.primary,
    double dimension = 35,
    double? iconSize,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(199)),
      child: Material(
        child: Ink(
          color: Colors.brown[100],
          height: dimension,
          width: dimension,
          child: InkWell(
            splashColor: UIConstant.splashColor,
            onTap: onTapIcon,
            child: Icon(
              iconData,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }

  static void showFoodModalSheet({
    required BuildContext context,
    required Widget child,
    final double contentRatio = 0.5,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Stack(
          children: [
            // Blurred Background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(
                    color: Colors.black.withOpacity(0.2)), // Dark overlay
              ),
            ),

            // Modal Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height *
                    contentRatio, // 50% height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Container(
                    height:
                        MediaQuery.of(context).size.height * 0.5, // 50% height
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

extension MediaDimension on State<StatefulWidget> {
  double get width {
    return MediaQuery.of(context).size.width;
  }

  double get height {
    return MediaQuery.of(context).size.height;
  }

  double get top {
    return MediaQuery.of(context).padding.top;
  }

  double get bottom {
    return MediaQuery.of(context).padding.bottom;
  }
}
