import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestaurantMediaView(restaurant: widget.restaurant),

            Container(
              width: width,
              height: height * 0.1,
              color: UIConstant.primary.withAlpha(129),
              child: Text(
                widget.restaurant.description.txt,
                style: UITextTheme.tsTitle,
              ),
            ),
            Divider(color: Colors.grey, height: 1.4),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text('Select Food Menu ', style: UITextTheme.tsTitle),
            ),
            Expanded(child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: _menuList.length,
              itemBuilder: _getMenuBuilder,
            ),),
          ],
        ),
      ),
    );
  }

  Widget _getMenuBuilder(ctx, index) {
    final menu = _menuList[index];
    return GestureDetector(
      onTap: () => toggleMenuSelection(menu),
      child: Card(
        child: Stack(
          children: [
            CachedNetworkImage(imageUrl: menu.profileImage),
            Center(
              child: Text(menu.menuName.txt, style: UITextTheme.tsTitle,),
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
