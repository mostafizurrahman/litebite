import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/restaurant/details/menu_view.dart';
import 'package:carvice/ui/home/restaurant/details/order_summary_view.dart';
import 'package:carvice/ui/utility/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uisystem/theme/text_theme.dart';

import 'restaurant_description_view.dart';
import 'restaurant_media_view.dart';

class RestaurantProfilePage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantProfilePage({required this.restaurant});

  @override
  State<StatefulWidget> createState() {
    return _RestaurantProfileState();
  }
}

class _RestaurantProfileState extends State<RestaurantProfilePage>
    implements MenuSelectionInterface {
  List<Menu> get _menuList => widget.restaurant.menu;

  final _orderController = BehaviorSubject<MOrder>.seeded({});
  @override
  Widget build(BuildContext context) {

    Widget _getOrderStack() {
      return Stack(
        children: [
          Column(
            children: [
              RestaurantMediaView(restaurant: widget.restaurant),
              RestaurantDescriptionView(restaurant: widget.restaurant),
              StreamBuilder<MOrder>(
                stream: _orderController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data.hasValue) {
                    return OrderSummaryView(orderMap: snapshot.data!);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getOrderStack(),
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
    return MenuView(menu: menu, selectionInterface: this);
  }

  @override
  void onSelected({required Menu menu}) {

    final keyValueMap = _orderController.valueOrNull;
    if (keyValueMap != null ) {
      if (keyValueMap.keys.contains(menu)) {
        int value = keyValueMap[menu]!;
        keyValueMap[menu] = value + 1;
        _orderController.sink.add(keyValueMap);
      } else {
        final data = {menu : 1};
        _orderController.sink.add(data);
      }
    }
  }
}
