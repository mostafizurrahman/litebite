import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/restaurant/details/restaurant_description_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/theme/text_theme.dart';

import 'restaurant_media_view.dart';

class RestaurantProfilePage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  State<StatefulWidget> createState() {
    return _RestaurantProfileState();
  }
}

class _RestaurantProfileState extends State<RestaurantProfilePage> {
  List<Menu> get _menuList => widget.restaurant.menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestaurantMediaView(restaurant: widget.restaurant),
          RestaurantDescriptionView(restaurant: widget.restaurant),
          Divider(color: Colors.grey, height: 1.4),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text('Select Food Menu ', style: UITextTheme.tsTitle),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _menuList.length,
              itemBuilder: _getMenuBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getMenuBuilder(ctx, index) {
    final menu = _menuList[index];
    return GestureDetector(
      onTap: () => toggleMenuSelection(menu),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Corner radius 5
        ),
        elevation: 6, // Controls the shadow depth
        shadowColor: Colors.black.withOpacity(0.5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(imageUrl: menu.profileImage),
            ),
            Positioned(
              bottom: 0,
              left: -1,
              right: -1,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.white,
                        Colors.white.withAlpha(240),
                        Colors.white.withAlpha(230),
                        Colors.white.withAlpha(220),
                        Colors.white.withAlpha(210),
                        Colors.white.withAlpha(200),
                        Colors.white.withAlpha(190),
                        Colors.white.withAlpha(180),
                      ], // Colorful background
                    ),
                  ),
                  child: Text(
                    menu.menuName.txt,
                    style: UITextTheme.tsTitle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void toggleMenuSelection(Menu menu) {
    // setState(() {
    //   if (selectedMenus.contains(menuName)) {
    //     selectedMenus.remove(menuName);
    //   } else {
    //     selectedMenus.add(menuName);
    //   }
    // });
  }
}
