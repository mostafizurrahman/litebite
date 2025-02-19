import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:uisystem/uisystem.dart';

import 'dialog_data_model.dart';
import 'filter_dialog_content_view.dart';

//contains
// 1. search view
// 2. filter button
// 3. show-filter dialog
// 4. Select from the filter
//

class FoodFilterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FoodFilterState();
  }
}

class _FoodFilterState extends State<FoodFilterView>
    implements SearchInterface {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: ContainerTheme.padding,
        child: Container(
          width: double.maxFinite,
          height: 120,
          decoration: ContainerTheme.shadowDec,
          child: Row(
            children: [
              TapWidget(
                iconData: FlutterIcons.filter_mdi,
                cornerRadius: 5,
                onTapWidget: _onTapWidget,
                width: width * 0.25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapWidget() {
    showDialog(context: context, builder: _getBuilder);
  }

  Widget _getBuilder(final BuildContext ctx) {
    return FilterDialog(
      dataList: foodFilterList,
      searchInterface: this,
    );
  }

  @override
  void onSelectedFilter(List<FoodResData> dataList) {
    debugPrint('---selected filter --- ${dataList[0].title}');
  }
}
