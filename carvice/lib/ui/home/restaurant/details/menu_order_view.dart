import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/domain.dart';
import '../../../utility/ui_builder.dart';
import 'details_constant.dart';

abstract class MenuRemoveInterface {
  void onRemove({required Menu menu, required num price});
}

class MenuOrderView extends StatefulWidget {
  final MenuRemoveInterface remover;
  final Menu menu;

  MenuOrderView({
    required this.menu,
    required this.remover,
  });

  @override
  State<StatefulWidget> createState() {
    return _MenuCheckState();
  }
}

class _MenuCheckState extends State<MenuOrderView> {
  final _removeBuilder = StreamController<bool>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: ContainerTheme.shadowMenu,
        width: ResDetailsConstant.removerWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.menu.profileImage,
                fit: BoxFit.cover,
                width: ResDetailsConstant.removerWidth,
                height: ResDetailsConstant.removerWidth,
              ),
              StreamBuilder<Object>(
                  stream: _removeBuilder.stream,
                  initialData: false,
                  builder: (context, snapshot) {
                    return _getInfoWidget();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getInfoWidget() {
    final half = widget.menu.regularCount;
    final full = widget.menu.fullCount;
    final one3 = widget.menu.one3Count;
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          decoration: ContainerTheme.linearDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(width: 12),
                  Text(
                    'Total : ${widget.menu.orderCount}',
                    style: UITextTheme.tsTitle,
                  ),
                  Expanded(child: const SizedBox()),
                  _getPlatterRow(_onRemoveMenu, '', iconData: Icons.cancel),
                ],
              ),
              Divider(
                height: 3,
                color: UIConstant.iconSelected,
              ),
              Expanded(child: const SizedBox()),
              if (half > 0) _getPlatterRow(_onRemoveHalf, 'REGULAR : $half'),
              if (full > 0) _getPlatterRow(_onRemoveFull, 'FULL : $full'),
              if (one3 > 0) _getPlatterRow(_onRemove3_1, '1:3 Person : $one3'),
              Divider(height: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  widget.menu.menuName.txt,
                  style:
                      UITextTheme.ts16Colored.copyWith(color: Colors.blueGrey),
                  maxLines: 1, // Limits to one line
                  overflow: TextOverflow.ellipsis, // Adds "..."
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPlatterRow(VoidCallback onRemoveItem, String text,
      {IconData iconData = Icons.remove_circle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text, style: UITextTheme.italic12Bold),
          const SizedBox(width: 8),
          UIBuilder.getPlusMinus(iconData, onRemoveItem),
        ],
      ),
    );
  }

  void _onRemoveHalf() {
    _onUpdateMenu(regular: widget.menu.price.half);
  }

  void _onRemoveMenu() {
    widget.remover.onRemove(menu: widget.menu, price: -1);
  }

  void _onRemove3_1() {
    _onUpdateMenu(regular: widget.menu.price.oneTo3);
  }

  void _onRemoveFull() {
    _onUpdateMenu(regular: widget.menu.price.full);
  }

  void _onUpdateMenu({required final num regular}) {
    final remove = widget.menu.setPlatter(price: regular, shouldRemove: true);
    if (remove) {
      widget.remover.onRemove(menu: widget.menu, price: regular);
    } else {
      _removeBuilder.sink.add(true);
    }
  }



  @override
  void dispose() {
    _removeBuilder.close();
    super.dispose();
  }
}
