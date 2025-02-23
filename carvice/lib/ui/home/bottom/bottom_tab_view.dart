import 'dart:async';

import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/button/tap_action.dart';
import 'package:uisystem/button/tap_widget.dart';
import 'package:uisystem/theme/constants.dart';

part 'tab_ui_data.dart';

abstract class BottomTabInterface {
  void onTapIndex({required int index});
}

class BottomTabView extends StatefulWidget {

  final BottomTabInterface tabInterface;
  BottomTabView({required this.tabInterface});
  @override
  State<StatefulWidget> createState() {
    return _BottomTabState();
  }
}

class _BottomTabState extends State<BottomTabView> implements TapAction{

  late final _tabs = _getTabList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 60,
      color: UIConstant.primary,
      child: Row(
        children: _getViewTabList() ,
      ),
    );
  }

  List<Widget> _getViewTabList() {
    final widgets = <Widget>[];
    for(final tab in _tabs) {

      widgets.add(_getViewFrom(tabData: tab));
    }
    return widgets;
  }

  Widget _getViewFrom({required final _TabUIData tabData}) {
    return StreamBuilder(
      stream: tabData._tabController.stream,
      builder: (ctx, AsyncSnapshot<bool> _snap) {
        final width = UIBuilder.width(context: context) / 5.0;
        final tapData = TapData(
          tapIndex: _tabs.indexOf(tabData),
          identifier: tabData.title,
          meta: tabData,
        );
        return TapWidget(
          shadowColor: null,
          background: tabData.isSelected ? UIConstant.iconSelected : UIConstant.primary,
          cornerRadius: 0,
          borderColor: Colors.grey,
          borderWidth: 0.5,
          subtitle: tabData.title,
          height: 60,
          width: width,
          iconData: tabData.iconData,
          tapAction: this,
          tapData: tapData,
          textColor: Colors.white,
        );
      },
    );
  }

  @override
  void onTapWidget({required TapData data}) {
    final tabData = data.meta as _TabUIData;
    final selected = _tabs.firstWhere(_isSelected);
    if (selected != tabData) {
      _changeTab(tabData, true);
      _changeTab(selected, false);

    }
  }

  void _changeTab(_TabUIData data, bool isSelected) {

    debugPrint('---index ${data.index}');
    data._tabController.sink.add(isSelected);
    data.isSelected = isSelected;
    if(isSelected) {
      widget.tabInterface.onTapIndex(index: data.index);
    }
  }

  bool _isSelected(_TabUIData data) {
    return data.isSelected;
  }

  void _dispose(_TabUIData data) {
    data._tabController.close();
  }

  @override
  void dispose() {
    _tabs.forEach(_dispose);
    super.dispose();
  }
}