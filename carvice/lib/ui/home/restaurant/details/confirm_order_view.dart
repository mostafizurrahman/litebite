


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/uisystem.dart';

import '../../../../domain/domain.dart';
import 'menu_details_view.dart';




class MenuCheckView extends StatefulWidget {
  final MenuSelectionInterface selectionInterface;
  final Menu menu;
  MenuCheckView({
    required this.menu,
    required this.selectionInterface,
  });

  @override
  State<StatefulWidget> createState() {
    return _MenuCheckState();
  }
}

class _MenuCheckState extends State<MenuCheckView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration:  ContainerTheme.shadowMenu,

        width: width * 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Stack(
            children: [
              CachedNetworkImage(imageUrl: widget.menu.profileImage, fit: BoxFit.cover,),
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
      ),
    );
  }

  Widget _getInfoWidget() {
    return  Positioned.fill(

      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          height: 70,
          decoration: ContainerTheme.linearDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total Count : ${widget.menu.orderCount}', style: UITextTheme.tsTitle,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _widgets(),
              ),
              Divider(height: 1),
              Text(
                widget.menu.menuName.txt,
                style: UITextTheme.selected14Title,
                maxLines: 1, // Limits to one line
                overflow: TextOverflow.ellipsis, // Adds "..."
              ),
            ],
          ),
        ),
      ),
    );
  }



  List<Widget> _widgets() {
    // if (widget.shouldDelete) {
    //   final String type = widget.menu.selectedPrice == widget.menu.price.half ? 'Half ' : widget.menu.selectedPrice == widget.menu.price.full ? 'Full' :'Medium';
    //   return [Text(
    //     '$type \n${widget.menu.selectedPrice}',
    //     textAlign: TextAlign.center,
    //   )];
    // }
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
    widget.selectionInterface.onSelected(menu: menu);
    // setState(() {
    //   if (selectedMenus.contains(menuName)) {
    //     selectedMenus.remove(menuName);
    //   } else {
    //     selectedMenus.add(menuName);
    //   }
    // });
  }
}
