
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/entity/menu.dart';
import 'menu_details_page.dart';
import '../details/menu_order_view.dart';

import 'platter_size_dialog_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';




class OrderPreviewListView extends StatefulWidget {
  final List<Menu> menuList;
  final MenuRemoveInterface remover;

  OrderPreviewListView({
    required this.menuList,
    required this.remover,
  });

  @override
  State<StatefulWidget> createState() {
    return _OrderSummaryState();
  }
}

class _OrderSummaryState extends State<OrderPreviewListView>
    implements MenuRemoveInterface {
  int count({String type = 'FOOD'}) {
    return widget.menuList
        .where((data) => data.foodType.contains(type))
        .length;
  }

  int _selectedIndex = 1;

  Map<int, Widget> get _tabs => {
        0: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Icon(Icons.food_bank),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text('Foods ${count()}'),
              )
            ],
          ),
        ),
        1: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Icon(Icons.restaurant),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text('All Foods ${widget.menuList.length}'),
              )
            ],
          ),
        ),
        2: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              Icon(Icons.local_drink),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text('Drinks ${count(type: 'DRINKS')}'),
              )
            ],
          ),
        ),
      };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 12),
              TapWidget(
                iconData: Icons.arrow_back,
                iconColor: UIConstant.primary,
                background: Colors.black12,
                cornerRadius: 30,
                onTapWidget: _onTapType,
                width: 50,
                height: 50,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              CupertinoSegmentedControl<int>(
                children: _tabs,
                onValueChanged: (int value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                groupValue: _selectedIndex,
                selectedColor: UIConstant.primary,
                borderColor: UIConstant.primary,
                unselectedColor: Colors.white,
              ),
              const SizedBox(width: 3),
              TapWidget(
                background: UIConstant.iconSelected,
                onTapWidget: _onConfirmOrder,
                width: 75,
                height: 50,
                title: ' NEXT⮕ ',
                textColor: Colors.white,
              ),
              const SizedBox(width: 12),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Set horizontal scrolling
              itemCount: widget.menuList.length, // Number of items
              itemBuilder: _getOrderView,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getOrderView(context, index) {
    final data = widget.menuList[index];
    return Container(
      width: 400,
      // decoration: ContainerTheme.shadowMenu,
      child: Stack(
        children: [
          MenuOrderView(
            menu: data,
            remover: this,
          ),
        ],
      ),
    );
  }

  void _onTapType() {}

  void _onConfirmOrder() {}


  // @override
  // void onTapDetails({required Menu menu}) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => MenuDetailsPage(
  //         menu: menu,
  //         selectionInterface: widget.platterInterface,
  //       ),
  //     ),
  //   );
  // }

  @override
  void onRemove({required Menu menu, required num price}) {
    widget.remover.onRemove(menu: menu, price: price);
  }
}
