import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/restaurant/details/menu_details_view.dart';
import 'package:carvice/ui/home/restaurant/details/platter_size_dialog_view.dart';
import 'package:carvice/ui/utility/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uisystem/theme/text_theme.dart';

import '../../../utility/ui_builder.dart';
import '../../../widgets/gradient_blur_view.dart';
import '../menu/menu_details_page.dart';
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

  final _orderController = BehaviorSubject<List<Menu>>.seeded([]);

  Widget _getOrderStack() {
    return Stack(
      children: [
        Column(
          children: [
            RestaurantMediaView(restaurant: widget.restaurant),
            RestaurantDescriptionView(restaurant: widget.restaurant),
          ],
        ),
        StreamBuilder<List<Menu>>(
          stream: _orderController.stream,
          builder: (context, snapshot) {
            if (snapshot.data?.isNotEmpty ?? false) {
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
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: Text('Select Food Menu ', style: UITextTheme.tsTitle),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _menuList.length, // Replace with your list
              itemBuilder: _getMenuBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBlurOrderView(List<Menu> menuList) {
    final view = OrderSummaryTopView(
      menuList: menuList,
      updateInterface: this,
      platterInterface: this,
    );
    return GradientBlurView(child: view);
  }

  Widget _getMenuBuilder(ctx, index) {
    final menu = _menuList[index];
    return MenuDetailsView(menu: menu, selectionInterface: this);
  }

  @override
  void onSelected({required Menu menu}) {
    if (menu.price.full > 0 || menu.price.oneTo3 > 0) {
      final child = _getPlatterSelectionView(menu: menu);
      UIBuilder.showFoodModalSheet(context: context, child: child);
    } else {_setOrder(menu: menu);
    }
  }

  Widget _getPlatterSelectionView({required Menu menu}) {
    return PlatterPriceDialogView(
      menu: menu,
      interface: this,
    );
  }

  String _getMenuID(Menu menu) {
    return menu.menuID;
  }

  @override
  void onUpdated({required List<Menu> menuMap}) {
    _orderController.sink.add(menuMap);
  }

  @override
  void onSelectedPlatter({required Menu menu, required num price}) {
    Navigator.of(context).pop();
    menu.setPlatter(price: price);
    _setOrder(menu: menu);
  }

  void _setOrder({required Menu menu}) {
    if (_menuList.contains(menu)) {
      _menuList.add(menu);
    }
    _orderController.sink.add(_menuList);
  }

  @override
  void onTapDetails({required Menu menu}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuDetailsPage(
          menu: menu,
          selectionInterface: this,
        ),
      ),
    );
  }
}
