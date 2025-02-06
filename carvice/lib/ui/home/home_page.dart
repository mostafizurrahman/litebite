
import 'package:flutter/material.dart';

import 'bottom/bottom_tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> implements BottomTabInterface {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Text('You are done and doing nothing'),
          ),
        ),
      ),
      bottomNavigationBar: BottomTabView(tabInterface: this),
    );
  }

  @override
  void onTapIndex({required int index}) {
    // TODO: implement onTapIndex
  }
}
