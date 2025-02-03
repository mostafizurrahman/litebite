


import 'dart:io';

import 'package:carvice/config/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uisystem/uisystem.dart';

import '../utility/ui_builder.dart';
import '../widgets/image_widget.dart';

class LandingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final title = localization.getText(key: 'title_landing');
    final subtitle = localization.getText(key: 'subtitle_landing');
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        title: Text(
          localization.getText(key: 'app_name'),
          style: UITextTheme.tsAppBar,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ImageWidget.svgWidget
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(title, style: UITextTheme.tsTitle),
              const SizedBox(height: 16),
              Text(subtitle, style: UITextTheme.tsNormal),
              const SizedBox(height: 24),
              TapWidget(
                title: 'Sign in With Google',
                iconData: Icons.mail,
                width: UIBuilder.width(context: context) - 48,
              ),
              ..._getAppleSignIn(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 32,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text('lite-bite: food menu app for eaters - 2025'),
        ),
      ),
    );
  }

  List<Widget> _getAppleSignIn() {
    if (Platform.isIOS) {
      return [const SizedBox(height: 24),
        TapWidget(
          title: 'Sign in With Apple',
          iconData: Icons.apple,
          width: UIBuilder.width(context: context) - 48,
        ),];
    }
    return [];
  }
}
