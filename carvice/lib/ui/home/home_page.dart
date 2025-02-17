import 'dart:async';

import 'package:carvice/ui/home/restaurant/restaurant_home_page.dart';
import 'package:carvice/ui/home/restaurant/widgets/restaurant_view.dart';
import 'package:flutter/material.dart';

import '../../config/services.dart';
import 'bottom/bottom_tab_view.dart';
import 'epicure/epicure_home_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> implements BottomTabInterface {
  final _tabController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_selectTabIndex);
  }

  void _selectTabIndex(_) {
    _tabController.sink.add(0);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder(
          stream: _tabController.stream,
          builder: _getTabView,
        ),
      ),
      // bottomNavigationBar: BottomTabView(tabInterface: this),
    );
  }

  Widget _getTabView(final BuildContext ctx, final AsyncSnapshot<int> data) {
    if (data.hasData && data.data != null) {
      return RestaurantHomePage();
    }
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('You are done and doing nothing'),
      ),
    );
  }

  @override
  void onTapIndex({required int index}) {
    _tabController.sink.add(index);
  }
}
