import 'package:flutter/material.dart';
import 'package:uisystem/theme/constants.dart';

import 'tap_action.dart';

class TapWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final TapData? tapData;
  final String subtitle;
  final Color? subTitleColor;
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
  final Widget? child;

  //for padding - true -> horizontal padding or false -> vertical padding
  final bool isHorizontal;

  //for alignment of icon and title
  // - true -> Column([]) or false -> Row([])
  final bool isVertical;

  const TapWidget({
    super.key,
    this.isHorizontal = true,
    this.isVertical = false,
    this.tapAction,
    this.onTapWidget,
    this.title = '',
    this.subtitle = '',
    this.subTitleColor,
    this.iconData,
    this.background = UIConstant.scaffoldBG,
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
    this.child,
  }) : assert(
          (tapData == null) == (tapAction == null),
          "Tab action and tab data are required",
        );

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
          // color: Colors.transparent,
          child: _getBody(context),
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Ink(
      color: isEnabled ? background : Colors.grey,
      child: InkWell(
        splashColor: UIConstant.splashColor,
        focusColor: UIConstant.primary,
        onTap: isEnabled ? _onTap : null,
        child: child ?? _getButtonContent(),
      ),
    );
  }

  Widget _getButtonContent() {
    if (title.isEmpty && subtitle.isEmpty && iconData != null) {
      return Icon(iconData, color: iconColor ?? UIConstant.primary);
    }
    final List<Widget> widgets = [];

    if (title.isNotEmpty) {
      final titleTxt = Text(
        title,
        style: textColor != null
            ? UIConstant.buttonTitleST.copyWith(color: textColor)
            : UIConstant.buttonTitleST,
      );
      if (subtitle.isNotEmpty) {
        final subtitleTxt = Text(
          subtitle,
          style:subTitleColor != null ? UIConstant.buttonSubtitleST.copyWith(color: subTitleColor) : UIConstant.buttonSubtitleST,
        );
        final column = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getTitleView(titleTxt),
            // SizedBox(height: height * 0.1),
            subtitleTxt,
          ],
        );
        widgets.add(column);
      } else {
        widgets.add(
          _getTitleView(titleTxt),
        );
      }
    } else if (subtitle.isNotEmpty && iconData != null) {
      final subtitleTxt = Text(
        subtitle,
        style: UIConstant.buttonSubtitleST.copyWith(
          color: textColor ?? Colors.black12,
        ),
      );
      final column = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData!,
            color: iconColor ?? Colors.white,
            size: 24,
          ),
          const SizedBox(height: 8),
          subtitleTxt,
        ],
      );
      widgets.add(column);
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  Widget _getTitleView(Text titleTxt) {
    if (_multipleContent) {
      final widgets = [
        Icon(
          iconData!,
          color: iconColor ?? Colors.white,
          size: 24,
        ),
        isVertical
            ? const SizedBox(
                height: 8,
              )
            : const SizedBox(
                width: 8,
              ),
        titleTxt
      ];

      return isVertical
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center, children: widgets)
          : Row(children: widgets);
    }
    return titleTxt;
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(cornerRadius * 2),
      border: _getBorder(),
      boxShadow: _getShadow(),
    );
  }

  Border? _getBorder() {
    if (borderWidth > 0) {
      if (isHorizontal) {
        return Border.symmetric(
          vertical: BorderSide(color: Colors.grey, width: borderWidth),
        );
      }
      return Border.all(color: Colors.blueAccent);
    }
    return null;
  }

  List<BoxShadow>? _getShadow() {
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
