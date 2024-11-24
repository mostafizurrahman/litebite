


import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';

import 'tap_action.dart';

class TapWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final TapData? tapData;
  final String subtitle;
  final String imagePath;
  final Color? textColor;
  final Color? iconColor;
  final Color? background;
  final IconData? iconData;
  final Color? borderColor;
  final Color? shadowColor;
  final double borderWidth;
  final double cornerRadius;
  final TapAction? tapAction;
  final bool isEnabled;
  final VoidCallback? onTapWidget;

  const TapWidget({
    super.key,
    this.tapAction,
    this.onTapWidget,
    this.title = 'Tap Me',
    this.subtitle = '',
    this.iconData,
    this.background = UIConstant.primary,
    this.borderColor,
    this.borderWidth = 0,
    this.height = 60,
    this.iconColor,
    this.imagePath = '',
    this.textColor,
    this.width = 200,
    this.cornerRadius = 5,
    this.shadowColor = UIConstant.shadowCL,
    this.isEnabled = true,
    this.tapData,
  });

  bool get _hasBorder => borderWidth > 0;

  bool get _isRound => cornerRadius > 0;

  bool get _hasGraphics => imagePath.isNotEmpty || iconData != null;

  bool get _hasSubtitle => subtitle.isNotEmpty;

  bool get _multipleContent => _hasGraphics && title.isNotEmpty;

  bool get _hasTapData => tapData != null && tapAction != null;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: _getDecoration(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: Material(
        color: Colors.transparent,
        child: _getBody(context),
      ),
    ),);
  }

  Widget _getBody(BuildContext context) {

    return  Ink(

        color: isEnabled ?  background: Colors.grey,
        child: InkWell(
          splashColor: Colors.amber,
          focusColor:  Colors.redAccent ,

          onTap: isEnabled ? _onTap : null,

          child: _getButtonContent(),
        ),
      );
  }

  Widget _getButtonContent() {
    final List<Widget> widgets = [];

    if (title.isNotEmpty) {
      final titleTxt = Text(
        title,
        style: UIConstant.buttonTitleST,
      );
      if (subtitle.isNotEmpty) {
        final subtitleTxt = Text(
          subtitle,
          style: UIConstant.buttonSubtitleST,
        );
        final column = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleTxt,
            // SizedBox(height: height * 0.1),
            subtitleTxt,
          ],
        );
        widgets.add(column);
      } else {
        widgets.add(titleTxt);
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(cornerRadius * 2),
      boxShadow:  _getShadow(),
    );
  }

  List<BoxShadow> ? _getShadow() {
    if (shadowColor != null) {

      return [
        BoxShadow(
          color: shadowColor!,
          blurRadius: cornerRadius,
        ),
      ];
    }
    return null;
  }


  void _onTap() {
    if (_hasTapData) {
      tapAction!.onTapWidget(data: tapData!);
    } else {
      final action = onTapWidget;
      if (action != null) {
        action();
      }
    }
  }
}