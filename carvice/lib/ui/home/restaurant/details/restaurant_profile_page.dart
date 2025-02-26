import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/restaurant/details/menu_view.dart';
import 'package:carvice/ui/home/restaurant/details/restaurant_description_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/theme/container_theme.dart';
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
    return MenuView(menu: menu);
  }


}
