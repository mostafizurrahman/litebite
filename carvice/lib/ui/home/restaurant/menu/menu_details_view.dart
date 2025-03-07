
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/ui/home/restaurant/details/details_constant.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/domain.dart';

abstract class MenuSelectionInterface {
  void onSelected({required Menu menu});
  void onTapDetails({required Menu menu});
}

class MenuDetailsView extends StatelessWidget {
  final MenuSelectionInterface selectionInterface;
  final Menu menu;

  const MenuDetailsView({
    required this.menu,
    required this.selectionInterface,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        height: ResDetailsConstant.platterHeight,
        child: Row(
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              child: CachedNetworkImage(
                imageUrl: menu.profileImage,
                width: ResDetailsConstant.platterHeight,
                height: ResDetailsConstant.platterHeight,
                fit: BoxFit.cover,
              ),
            ),

            // Info Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.menuName.txt,
                      style: UITextTheme.ts14BBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _priceWidgets(menu, width),
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 48,
                        child: Material(
                          color: UIConstant.iconSelected,
                          child: Ink(
                            child: InkWell(
                              splashColor: UIConstant.splashColor,
                              onTap: () => selectionInterface.onSelected(
                                menu: menu,
                              ),
                              child: _getContent(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Tap Button (Menu Details)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => selectionInterface.onTapDetails(menu: menu),
                child: Container(
                  width: 60,
                  height: ResDetailsConstant.platterHeight,
                  decoration: const BoxDecoration(
                    color: UIConstant.primary,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(6),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward_rounded, color: Colors.white),
                      SizedBox(height: 4),
                      Text(
                        "Menu\nDetails",
                        textAlign: TextAlign.center,
                        style: UITextTheme.ts12White,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _priceWidgets(Menu menu, double width) {
    final List<Widget> widgets = [];

    if (menu.price.half > 0) {
      widgets.add(_priceItem('Regular', menu.price.half, width));
    }

    if (menu.price.full > 0) {
      widgets.add(_priceItem('Full', menu.price.full, width));
    }

    if (menu.price.oneTo3 > 0) {
      widgets.add(_priceItem('3 Persons', menu.price.oneTo3, width));
    }

    return widgets;
  }

  Widget _priceItem(String label, num price, double width) {
    final dimension = (width - 228) / 3;
    return SizedBox(
      width: dimension,
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            "৳$price",
            style: const TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _getContent() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.fastfood_rounded,
          color: Colors.white,
        ),
        SizedBox(width: 12),
        Text(
          'Place Order',
          style: UITextTheme.ts13WhiteSub,
        ),
      ],
    );
  }
}
