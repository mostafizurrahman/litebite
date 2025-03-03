import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvice/ui/utility/ui_builder.dart';
import 'package:flutter/material.dart';
import 'package:uisystem/button/tap_widget.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/theme/container_theme.dart';
import 'package:uisystem/theme/text_theme.dart';

import '../../../../domain/domain.dart';
import 'details_constant.dart';

abstract class SelectedPlatterInterface {
  void onSelectedPlatter({required Menu menu, required num price});
}

class PlatterPriceDialogView extends StatefulWidget {
  final Menu menu;
  final SelectedPlatterInterface interface;

  PlatterPriceDialogView({required this.menu, required this.interface});

  @override
  State<StatefulWidget> createState() {
    return _PlatterSizeDialogState();
  }
}

class _PlatterSizeDialogState extends State<PlatterPriceDialogView> {
  double get buttonWidth => width / 3 - 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            widget.menu.menuName.txt,
            style: UITextTheme.tsTitle.copyWith(color: UIConstant.primary),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: widget.menu.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: ContainerTheme.linearDecoration,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.menu.price.half > 0) _getRegular(),
                    if (widget.menu.price.full > 0) _getFull(),
                    if (widget.menu.price.oneTo3 > 0) _getOneByThree(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRegular() {
    return TapWidget(
      width: buttonWidth,
      height: ResDetailsConstant.platterHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              'lib/assets/price/regular.png',
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Regular Size',
            style: UITextTheme.ts16Colored,
          ),
          const SizedBox(width: 12),
          Text(
            'BDT৳ ${widget.menu.price.half}',
            style: UITextTheme.ts13Subtitle,
          ),
        ],
      ),
      onTapWidget: () {
        widget.interface.onSelectedPlatter(
          menu: widget.menu,
          price: widget.menu.price.half,
        );
      },
    );
  }

  Widget _getFull() {
    return TapWidget(
      width: buttonWidth,
      height: ResDetailsConstant.platterHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              'lib/assets/price/full.png',
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Full Platter',
            style: UITextTheme.ts16Colored,
          ),
          const SizedBox(width: 12),
          Text(
            'BDT৳ ${widget.menu.price.full}',
            style: UITextTheme.ts13Subtitle,
          ),
        ],
      ),
      onTapWidget: () {
        widget.interface.onSelectedPlatter(
          menu: widget.menu,
          price: widget.menu.price.full,
        );
      },
    );
  }

  Widget _getOneByThree() {
    return TapWidget(
      width: buttonWidth,
      height: ResDetailsConstant.platterHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              'lib/assets/price/3_1.png',
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Buy 3:1',
            style: UITextTheme.ts16Colored,
          ),
          const SizedBox(width: 12),
          Text(
            'BDT৳ ${widget.menu.price.full}',
            style: UITextTheme.ts13Subtitle,
          ),
        ],
      ),
      onTapWidget: () {
        widget.interface.onSelectedPlatter(
          menu: widget.menu,
          price: widget.menu.price.oneTo3,
        );
      },
    );
  }
}
