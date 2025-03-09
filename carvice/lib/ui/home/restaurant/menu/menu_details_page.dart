import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/ui/home/bottom/bottom_tab_view.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/uisystem.dart';
import '../../../../domain/domain.dart';
import 'platter_size_dialog_view.dart';

class MenuDetailsPage extends StatefulWidget {
  final SelectedPlatterInterface selectionInterface;
  final Menu menu;

  const MenuDetailsPage({
    required this.menu,
    required this.selectionInterface,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _MenuDetailsState();
  }
}

class _MenuDetailsState extends State<MenuDetailsPage> {
  final _price = StreamController<num>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menu.menuName.txt),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          _buildCoverImage(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(),
                  SizedBox(height: 16),
                  _buildPriceOptions(),
                  SizedBox(height: 16),
                  _buildReviewSection(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          SizedBox(width: 220, height: 55, child: _buildAddToOrderButton()),
    );
  }

  Widget _buildCoverImage() {
    return CachedNetworkImage(
      imageUrl: widget.menu.coverImage,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.menu.menuName.txt,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "${widget.menu.foodType} | Popular: ${widget.menu.isPopular ? 'Yes' : 'No'}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceOptions() {
    return StreamBuilder<num>(
        stream: _price.stream,
        builder: (context, snapshot) {
          final price = snapshot.data ?? widget.menu.price.half;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (widget.menu.price.half > 0)
                _buildPriceTile("Half", widget.menu.price.half, price),
              if (widget.menu.price.full > 0)
                _buildPriceTile("Full", widget.menu.price.full, price),
              if (widget.menu.price.oneTo3 > 0)
                _buildPriceTile("1:3", widget.menu.price.oneTo3, price),
            ],
          );
        });
  }

  Widget _buildPriceTile(String label, num price, num selectedPrice) {
    return TapWidget(
      width: 90,
      borderWidth: 1.4,
      borderColor: UIConstant.primary,
      onTapWidget: () => _price.sink.add(price),
      child: Column(
        children: [
          const SizedBox(height: 6),
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("৳ $price", style: TextStyle(fontSize: 18, color: Colors.green)),
          if (price == selectedPrice)
            Container(
              decoration: ContainerTheme.shadowLine,
              width: double.maxFinite,
              height: 8,
            ),
        ],
      ),
    );
  }

  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reviews",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: List.generate(
              5, (index) => Icon(Icons.star, color: Colors.amber, size: 20)),
        ),
        SizedBox(height: 8),
        Text("(${widget.menu.reviewList.length} Reviews)",
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildAddToOrderButton() {
    return StreamBuilder<num>(
      stream: _price.stream,
      initialData: widget.menu.price.half,
      builder: (context, snapshot) {
        final text = widget.menu.getPriceName(price: snapshot.data ?? 0 );
        return ElevatedButton.icon(
          onPressed: () => widget.selectionInterface.onSelectedPlatter(
            price: snapshot.data ?? widget.menu.price.half,
            menu: widget.menu,
          ),
          icon: Icon(Icons.add_shopping_cart),
          label: Column(
            children: [
              Text("Add to Order"),
              Text(
                text + ': ৳ ${snapshot.data}',
                style: UITextTheme.colorTitle,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        );
      },
    );
  }
}
