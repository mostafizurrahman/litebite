


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:uisystem/theme/constants.dart';
import 'package:uisystem/uisystem.dart';

enum RegActionType {
  mobile,
  email,
}

extension RegTypeVal on RegActionType {
  String get value {
    if (this == RegActionType.email) {
      return 'Email';
    }

    return 'Mobile';
  }
}

class RegistrationSelectionView extends StatelessWidget {

  final StreamController<RegActionType?> regTapController;

  const RegistrationSelectionView({
    required this.regTapController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Create Account\n&\nGet Service',
          style: UIConstant.buttonTitleST,
        ),
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TapWidget(
            title: 'Register Via Mobile',
            iconData: CupertinoIcons.phone_circle_fill,
            onTapWidget: (){
              regTapController.sink.add(RegActionType.mobile);
            },
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TapWidget(
            title: 'Register Via Email',
            iconData: CupertinoIcons.mail_solid,
            onTapWidget: (){
              regTapController.sink.add(RegActionType.email);
            },
          ),
        ),
      ],
    );
  }

}