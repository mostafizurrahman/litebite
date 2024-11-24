

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uisystem/button/tap_widget.dart';

import 'registration_selection_view.dart';

class OTPInputPage extends StatefulWidget {
  final RegActionType type;

  OTPInputPage({required this.type});
  @override
  State<StatefulWidget> createState() {
    return _OTPViewState();
  }
}

class _OTPViewState extends State<OTPInputPage> {

  final  _tapController = StreamController<bool>();
  @override
  Widget build(BuildContext context) {
    final typeStr = widget.type.value;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 48),
          Text('Verification Code'),
          SizedBox(height: 12),
          Text('Enter your 6-Digit code sent to your $typeStr'),
          SizedBox(height: 24),
          getOTPWidget(context),
        ],
      ),

      // bottomNavigationBar: Container(color: Colors.greenAccent, h),
    );
  }

  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitEntered(String value, int index) {

    if (value.isNotEmpty) {
      _controllers[index].text = value;
      if (index < 5) {
        _focusNodes[index + 1].requestFocus(); // Move to the next field
      } else {
        _focusNodes[index].unfocus(); // Unfocus the last field
      }
    }
  }


  int _activeIndex = 0;

  bool _isDigit(KeyEvent event) =>
      event.logicalKey.keyId >= LogicalKeyboardKey.digit0.keyId
          && event.logicalKey.keyId <= LogicalKeyboardKey.digit9.keyId;

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {

    // final index = _focusNodes.indexWhere((node) => node.hasFocus);
    // final controller = _controllers[index];
    // if (event.logicalKey == LogicalKeyboardKey.backspace) {
    //   controller.text = '';
    //   if (index > 0) {
    //     _focusNodes[index - 1].requestFocus();
    //     _activeIndex = index - 1;
    //   }
    // } else if ( event.character  != null && _isDigit(event)) {
    //   controller.text = event.character ?? '';
    //   if (index < 5) {
    //     _focusNodes[index + 1].requestFocus();
    //     _activeIndex = index + 1;
    //   }
    // }

    return KeyEventResult.ignored;
  }

  Widget getOTPWidget(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 48,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.redAccent),
                      decoration: InputDecoration(
                        counterText: '', // Hides the character counter
                        border: OutlineInputBorder(),

                      ),
                      onChanged: (text) => _onChanged(index: index, text: text),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 24),
            StreamBuilder<bool>(
              initialData: false,
              stream: _tapController.stream,
              builder: _buildTapWidget,
            ),
          ],
        ),
    );
  }

  Widget _buildTapWidget(context, AsyncSnapshot<bool> snapshot) {
    return TapWidget(
      width: MediaQuery.of(context).size.width - 48,
      title: 'Submit OTP',
      onTapWidget: _hasText,
      isEnabled: snapshot.data ?? false,
    );
  }


  void _hasText() {
    final otp = _controllers.map((c) => c.text).join();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Entered OTP: $otp")),
    );
  }

  void _onChanged({required String text, required int index}) {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 6) {
      _tapController.sink.add(true);
    } else if (otp.length == 5) {
      _tapController.sink.add(false);
    }
    if (text.isEmpty) {
      _controllers[index].clear();
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controllers[index - 1].text.length,
        );
        _activeIndex = index - 1;
      }
    } else {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
        _activeIndex = index + 1;
        _controllers[index + 1].selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controllers[index - 1].text.length,
        );
      }
    }
  }
}

