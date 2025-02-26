import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/domain.dart';

abstract class MenuSelectionInterface {
  void onSelected({required Menu menu});
}

class MenuView extends StatefulWidget {
  final MenuSelectionInterface selectionInterface;
  final Menu menu;

  MenuView({
    required this.menu,
    required this.selectionInterface,
  });

  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: ContainerTheme.shadowMenu,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        child: Stack(
          children: [
            CachedNetworkImage(imageUrl: widget.menu.profileImage),
            _getInfoWidget(),
            Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  splashColor: UIConstant.amber.withOpacity(0.6), // Optional ripple effect color
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () => toggleMenuSelection(widget.menu),
                  child: SizedBox.expand(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getInfoWidget() {
    return  Positioned(
      bottom: 0,
      left: -1,
      right: -1,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          height: 70,
          decoration: ContainerTheme.linearDecoration,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _widgets(),
              ),
              Divider(height: 1),
              Text(
                widget.menu.menuName.txt,
                style: UITextTheme.colorTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _widgets() {
    final widgets = <Widget>[];
    if (widget.menu.price.half > 0) {
      widgets.add(
        Text(
          'Small\n${widget.menu.price.half}',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (widget.menu.price.full > 0) {
      widgets.add(
        Text(
          'Full\n${widget.menu.price.full}',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (widget.menu.price.oneTo3 > 0) {
      widgets.add(
        Text(
          '1:3\n${widget.menu.price.oneTo3}',
          textAlign: TextAlign.center,
        ),
      );
    }
    return widgets;
  }

  void toggleMenuSelection(Menu menu) {
    // setState(() {
    //   if (selectedMenus.contains(menuName)) {
    //     selectedMenus.remove(menuName);
    //   } else {
    //     selectedMenus.add(menuName);
    //   }
    // });
  }
}
