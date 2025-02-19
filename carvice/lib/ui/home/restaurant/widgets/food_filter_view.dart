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
      color: Colors.white,
      child: Padding(
        padding: ContainerTheme.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Restaurants',
                style: UITextTheme.tsTitleL,
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: ContainerTheme.shadowDecCircle,
                  child: TapWidget(
                    iconData: Icons.filter_list,
                    cornerRadius: width * 0.25,
                    onTapWidget: _onTapWidget,
                    background: Colors.black12,
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: ContainerTheme.shadowDecCircle,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: UITextTheme.hintTxt,
                        border: InputBorder.none, // Removes default underline
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black54,
                        ), // Search icon
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
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
