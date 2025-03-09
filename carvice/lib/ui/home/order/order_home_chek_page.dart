import 'package:carvice/ui/home/bottom/bottom_tab_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/text_theme.dart';

import '../../../domain/domain.dart';

import 'package:cached_network_image/cached_network_image.dart';

class OrderHomeCheckPage extends StatefulWidget {
  final List<Menu> orderList;

  OrderHomeCheckPage({required this.orderList});

  @override
  _OrderHomeCheckPageState createState() => _OrderHomeCheckPageState();
}

class _OrderHomeCheckPageState extends State<OrderHomeCheckPage> {
  void _updateOrder(Menu menu, num price, bool isAdding) {
    setState(() {
      menu.setPlatter(price: price, shouldRemove: !isAdding);
      if (menu.orderCount == 0) {
        widget.orderList.remove(menu);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Summary"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: widget.orderList.length,
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Divider(),
        ),
        itemBuilder: (context, index) {
          final menu = widget.orderList[index];
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6)),
              child: _buildMenuItem(menu));
        },
      ),
      bottomNavigationBar: StreamBuilder(stream: stream, builder: builder),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label:
            Text("Total: \$${widget.orderList.totalPrice.toStringAsFixed(2)}"),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildMenuItem(Menu menu) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: menu.profileImage,
          width: 120,
          height: 140,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(menu.menuName.txt,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ...menu.platterMap.entries.map(
                  (entry) => _buildPlatterRow(menu, entry.key, entry.value)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlatterRow(Menu menu, num price, int count) {
    if (count > 0) {
      final text = menu.getPriceName(price: price);
      return Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$text (${price.toStringAsFixed(2)})", style: UITextTheme.ts14BBold,),
            Row(
              children: [
                _buildActionButton(menu, price, false),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "$count",
                        style: UITextTheme.ts14BBold.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    width: 35,
                  ),
                ),
                _buildActionButton(menu, price, true),
              ],
            ),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _buildActionButton(Menu menu, num price, bool isAdding) {
    final iconData = isAdding ? Icons.add : Icons.remove;
    return UIBuilder.getPlusMinus(
      iconData,
      () => _updateOrder(menu, price, isAdding),
    );
  }
}
