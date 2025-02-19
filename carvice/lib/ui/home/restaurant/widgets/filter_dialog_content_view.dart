import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/uisystem.dart';

import 'dialog_data_model.dart';

class FilterDialog extends StatefulWidget {
  final List<FoodResData> dataList;
  final SearchInterface searchInterface;

  const FilterDialog({
    Key? key,
    required this.dataList,
    required this.searchInterface,
  }) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final _selectController = StreamController<bool>.broadcast();
  List<FoodResData> _selectedFilter = [];

  bool get isMax => _selectedFilter.length == 3;

  @override
  void initState() {
    super.initState();
    _selectedFilter.addAll(widget.dataList.where(_isSelectedItem).toList());
  }

  bool _isSelectedItem(FoodResData data) {
    return data.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Select Filter',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _getSelectionIndicator(),
                ],
              ),
            ),

            Divider(
              height: 1.5,
            ),
            const SizedBox(height: 16),

            // Filter list
            Flexible(
              child: StreamBuilder<Object>(
                  stream: _selectController.stream,
                  builder: _buildFilterListView),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Divider(
                height: 1.5,
              ),
            ),

            // Confirm Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                    child: const Text(
                      'Confirm Selection',
                      style: UITextTheme.tsTitle,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _getSelectionIndicator() {
    return StreamBuilder(
      stream: _selectController.stream,
      builder: (ctx, snap) {
        final TextStyle style;
        if (isMax) {
          style = TextStyle(
            color: isMax ? Colors.redAccent : Colors.blueGrey,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          );
        } else {
          style = TextStyle(
            color: Colors.blueGrey,
            fontSize: 12,
          );
        }
        return Text(
          'selected : ${_selectedFilter.length}/3',
          style: style,
        );
      },
    );
  }

  Widget _buildFilterListView(ctx, snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.dataList.length,
      itemBuilder: (context, index) {
        final item = widget.dataList[index];
        return FilterTile(
          data: item,
          onChanged: (selected) {
            _onSelectionChanged(selected, item);
          },
        );
      },
    );
  }

  void _onSelectionChanged(final bool selected, FoodResData item) {
    _selectController.sink.add(true);
    if (isMax && selected) {
      return;
    }
    item.isSelected = selected;
    if (item.isSelected) {
      _selectedFilter.add(item);
    } else {
      _selectedFilter.remove(item);
    }
    widget.searchInterface.onSelectedFilter(_selectedFilter);
  }
}

/*Title view class*/
class FilterTile extends StatelessWidget {
  final FoodResData data;
  final ValueChanged<bool> onChanged;

  const FilterTile({
    Key? key,
    required this.data,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Set corner radius to 5
      ),
      child: ListTile(
        splashColor: UIConstant.splashColor,
        focusColor: UIConstant.focusColor,
        onTap: () {
          onChanged(!data.isSelected);
        },
        leading: Icon(data.icon),
        title: Text(data.title),
        trailing: Checkbox(
          value: data.isSelected,
          onChanged: (value) => onChanged(value ?? false),
        ),
      ),
    );
  }
}
