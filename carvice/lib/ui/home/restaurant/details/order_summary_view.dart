import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';

import '../../../utility/ui_extension.dart';
import 'details_constant.dart';

class OrderSummaryView extends StatefulWidget {
  final MOrder orderMap;
  OrderSummaryView({required this.orderMap});
  @override
  State<StatefulWidget> createState() {
    return OrderSummaryState();
  }
}

class OrderSummaryState extends State<OrderSummaryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ratio =
        ResDetailsConstant.mediaViewRatio + ResDetailsConstant.descriptionRatio;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: height * ratio - 12,
        width: width - 24,
        child: Center(child: Text('I am here'),),
      ),
    );
  }
}
