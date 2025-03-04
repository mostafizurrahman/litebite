import 'package:carvice/ui/home/restaurant/details/menu_details_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/entity/menu.dart';
import '../../../utility/ui_extension.dart';
import '../menu/menu_details_page.dart';
import 'confirm_order_view.dart';
import 'platter_size_dialog_view.dart';
import 'restaurant_profile_page.dart';

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../utility/ui_extension.dart';

abstract class MenuUpdateInterface {
  void onUpdated({required List<Menu> menuMap});
}

class OrderSummaryTopView extends StatefulWidget {
  final List<Menu> menuList;
  final MenuUpdateInterface updateInterface;
  final SelectedPlatterInterface platterInterface;

  OrderSummaryTopView({
    required this.menuList,
    required this.updateInterface,
    required this.platterInterface,
  });

  @override
  State<StatefulWidget> createState() {
    return _OrderSummaryState();
  }
}

class _OrderSummaryState extends State<OrderSummaryTopView>
    implements MenuSelectionInterface {
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
          MenuCheckView(
            menu: data,
            selectionInterface: this,
          ),
        ],
      ),
    );
  }

  void _onTapType() {}

  void _onConfirmOrder() {}

  @override
  void onSelected({required Menu menu}) {
    // final keyValueMap = widget.menuList;
    // if (widget.menuList.contains(menu)) {
    //   int value = keyValueMap[menu]!;
    //   if (value == 1) {
    //     keyValueMap.remove(menu);
    //   } else {
    //     keyValueMap[menu] = --value;
    //   }
    //   widget.updateInterface.onUpdated(menuMap: keyValueMap);
    // }
  }

  @override
  void onTapDetails({required Menu menu}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuDetailsPage(
          menu: menu,
          selectionInterface: widget.platterInterface,
        ),
      ),
    );
  }
}
