import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/domain.dart';

class OrderConfirmationButton extends StatelessWidget {
  final double width;
  final List<Menu> menuList;
  final VoidCallback onNavigate;

  const OrderConfirmationButton({
    required this.width,
    required this.menuList,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final activeWidth = width * 0.85;
    int drink = menuList.drinkCount;
    int food = menuList.foodCount;
    num totalPrice = menuList.totalPrice;
    return Container(
      width: activeWidth,
      height: 55,
      decoration: ContainerTheme.shadowDec,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            color: UIConstant.iconSelected,
            height: 55,
            child: InkWell(
              splashColor: UIConstant.amber.withOpacity(0.75),
              onTap: onNavigate,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  SizedBox(
                    width: activeWidth / 2 - 18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Food : $food',
                              style: UITextTheme.tsTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 25,
                              width: 12,
                              child: VerticalDivider(
                                width: 4,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Drinks : $drink',
                              style: UITextTheme.tsTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          'Total Price $totalPrice BDT',
                          style: UITextTheme.ts14White.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: VerticalDivider(width: 3),
                  ),
                  Text(
                    'Confirm Order',
                    style: UITextTheme.ts14WBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 12),
                  UIBuilder.getPlusMinus(
                    Icons.check_circle,
                    null,
                    iconColor: UIConstant.texColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
