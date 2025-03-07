import 'package:carvice/domain/domain.dart';
import 'package:carvice/ui/home/order/order_home_chek_page.dart';
import 'package:carvice/ui/home/restaurant/menu/menu_details_view.dart';
import 'package:carvice/ui/home/restaurant/menu/platter_size_dialog_view.dart';
import 'package:carvice/ui/home/restaurant/widgets/order_confirmation_button.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uisystem/theme/text_theme.dart';
import 'package:uisystem/uisystem.dart';

import '../../../utility/ui_builder.dart';
import '../../../widgets/gradient_blur_view.dart';
import '../menu/menu_details_page.dart';
import 'menu_order_view.dart';
import 'order_remover_view.dart';
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
        MenuRemoveInterface,
        SelectedPlatterInterface {
  final List<Menu> _menuList = [];

  @override
  void initState() {
    super.initState();
    widget.restaurant.menu.forEach(_set);
  }

  void _set(Menu menu) {
    _menuList.add(menu.copyWith());
  }

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
      body: Stack(
        children: [
          Column(
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
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Material(
                    color: UIConstant.titleColor,
                    child: Ink(
                      width: 70,
                      child: InkWell(
                        splashColor: UIConstant.splashColor,
                        onTap: _onTapIcon,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'EXIT',
                                style: UITextTheme.ts14WBold,
                              ),
                            ),
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // child: UIBuilder.getPlusMinus(
                //   Icons.cancel,
                //   _onTapIcon,
                //   dimension: 45,
                //   iconSize: 35,
                // ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder(
        stream: _orderController.stream,
        builder: _getMenuCheckoutView,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onTapIcon() {
    Navigator.of(context).pop();
  }

  Widget _getMenuCheckoutView(
      final BuildContext ctx, final AsyncSnapshot<List<Menu>> snap) {
    if (snap.data.isNonNullEmpty) {
      return OrderConfirmationButton(
        width: width,
        menuList: snap.data!,
        onNavigate: _navigateToSummary,
      );
    }
    return const SizedBox();
  }

  void _navigateToSummary() {
    final route = MaterialPageRoute(builder: _getOrderCheckingPage);
    Navigator.of(context).push(route);
  }

  Widget _getOrderCheckingPage(BuildContext ctx) {
    final list = _orderController.valueOrNull ?? <Menu>[];
    return OrderHomeCheckPage(orderList: list);
  }

  Widget _getBlurOrderView(List<Menu> menuList) {
    final view = OrderRemoverView(remover: this, orderList: menuList);
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
    } else {
      _setOrder(menu: menu);
    }
  }

  Widget _getPlatterSelectionView({required Menu menu}) {
    return PlatterPriceDialogView(
      menu: menu,
      interface: this,
    );
  }

  @override
  void onRemove({required Menu menu, required num price}) {
    final list = _orderController.valueOrNull ?? [];
    if (list.contains(menu)) {
      menu.clear();
      list.remove(menu);
    }
    _orderController.sink.add(list);
  }

  @override
  void onSelectedPlatter({required Menu menu, required num price}) {
    Navigator.of(context).pop();
    menu.setPlatter(price: price);
    _setOrder(menu: menu);
  }

  void _setOrder({required Menu menu}) {
    final orderedMenuList = _orderController.valueOrNull ?? [];
    if (!orderedMenuList.contains(menu)) {
      orderedMenuList.add(menu);
    }
    _orderController.sink.add(orderedMenuList);
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
