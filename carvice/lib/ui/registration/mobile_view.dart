
import 'package:flutter/material.dart';
import 'package:uisystem/button/tap_widget.dart';

import 'otp_input_page.dart';
import 'registration_selection_view.dart';

class MobileView extends StatefulWidget {

  const MobileView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MobileState();
  }
}

class _MobileState extends State<MobileView> {
  final  _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text('Sign in with Email'),
        SizedBox(height: 8,),
        Text('An 6-digit code will be sent to this email account'),
        SizedBox(height: 8,),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter you email',
          ),
        ),
        SizedBox(height: 8,),
        TapWidget(title: 'Next', onTapWidget: _requestOTP,),
      ],
    );
  }

  void _requestOTP() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPInputPage(type: RegActionType.mobile)),
    );
  }
}