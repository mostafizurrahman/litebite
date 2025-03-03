import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/restaurant/details/menu_details_view.dart';
import 'package:carvice/ui/home/restaurant/details/platter_size_dialog_view.dart';
import 'package:carvice/ui/utility/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uisystem/theme/text_theme.dart';

import '../../../utility/ui_builder.dart';
import '../../../widgets/gradient_blur_view.dart';
import 'order_summary_view.dart';
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
    implements
        MenuSelectionInterface,
        MenuUpdateInterface,
        SelectedPlatterInterface {
  List<Menu> get _menuList => widget.restaurant.menu;

  final _orderController = BehaviorSubject<MOrder>.seeded({});

  Widget _getOrderStack() {
    return Stack(
      children: [
        Column(
          children: [
            RestaurantMediaView(restaurant: widget.restaurant),
            RestaurantDescriptionView(restaurant: widget.restaurant),
          ],
        ),
        StreamBuilder<MOrder>(
          stream: _orderController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.hasValue) {
              return Positioned.fill(
                child: _getBlurOrderView(snapshot.data!),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _getBlurOrderView(final MOrder menu) {
    final view = OrderSummaryTopView<MOrder>(
      data: menu,
      updateInterface: this,
    );
    return GradientBlurView(child: view);
  }

  Widget _getMenuBuilder(ctx, index) {
    final menu = _menuList[index];
    return MenuDetailsView(menu: menu, selectionInterface: this);
  }

  @override
  void onSelected({required Menu menu}) {
    if (menu.price.full > 0 || menu.price.half > 0) {
      final child = _getPlatterSelectionView(menu: menu);
      UIBuilder.showFoodModalSheet(context: context, child: child);
    } else {
      _onSelected(menu: menu);
    }
  }

  Widget _getPlatterSelectionView({required Menu menu}) {
    return PlatterPriceDialogView(
      menu: menu,
      interface: this,
    );
  }

  void _onSelected({required Menu menu}) {
    final keyValueMap = _orderController.valueOrNull;
    if (keyValueMap != null) {
      if (keyValueMap.keys.contains(menu)) {
        int value = keyValueMap[menu]!;
        keyValueMap[menu] = value + 1;
        _orderController.sink.add(keyValueMap);
      } else {
        final data = {menu: 1};
        _orderController.sink.add(data);
      }
    }
  }

  @override
  void onUpdated({required Map<Menu, int> menuMap}) {
    _orderController.sink.add(menuMap);
  }

  @override
  void onSelectedPlatter({required Menu menu, required num price}) {
    Navigator.of(context).pop();
    menu.selectedPrice = price;
    _onSelected(menu: menu);
  }
}
