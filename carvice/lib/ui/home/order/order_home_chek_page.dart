import 'package:carvice/ui/home/bottom/bottom_tab_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(16),
        itemCount: widget.orderList.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final menu = widget.orderList[index];
          return _buildMenuItem(menu);
        },
      ),
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
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
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
    return count > 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Platter (\$${price.toStringAsFixed(2)})"),
              Row(
                children: [
                  _buildActionButton(menu, price, false),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("$count", style: TextStyle(fontSize: 16)),
                  ),
                  _buildActionButton(menu, price, true),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }

  Widget _buildActionButton(Menu menu, num price, bool isAdding) {
    return InkWell(
      onTap: () => _updateOrder(menu, price, isAdding),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isAdding ? Colors.green : Colors.red,
        ),
        child: Icon(
          isAdding ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

//
// class OrderHomeCheckPage extends StatefulWidget {
//   final List<Menu> orderMenuList;
//   @override
//   State<StatefulWidget> createState() {
//     return _OrderHomePageState();
//   }
// }
//
// class _OrderHomePageState extends State<OrderHomeCheckPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Order Summary'),),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _MenuInfoView extends StatelessWidget {
//   final Menu menu;
//   const _MenuInfoView({required this.menu, super.key});
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
