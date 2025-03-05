import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import 'details_constant.dart';
import 'menu_order_view.dart';

class OrderRemoverView extends StatefulWidget {
  final List<Menu> orderList;
  final MenuRemoveInterface remover;

  const OrderRemoverView({required this.orderList, required this.remover});

  @override
  State<StatefulWidget> createState() {
    return _OrderRemoverState();
  }
}

class _OrderRemoverState extends State<OrderRemoverView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Set horizontal scrolling
          itemCount: widget.orderList.length, // Number of items
          itemBuilder: _getOrderView,
        ),
      ),
    );
  }

  Widget _getOrderView(context, index) {
    final data = widget.orderList[index];
    return Container(
      width: ResDetailsConstant.removerWidth,
      // decoration: ContainerTheme.shadowMenu,
      child: MenuOrderView(
        menu: data,
        remover: widget.remover,
      ),
    );
  }
}
