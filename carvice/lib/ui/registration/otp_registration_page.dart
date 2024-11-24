

import 'dart:async';

import 'package:carvice/ui/registration/email_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uisystem/button/tap_widget.dart';
import 'package:uisystem/theme/constants.dart';

import 'mobile_view.dart';
import 'registration_selection_view.dart';

class MobileRegistrationPage extends StatefulWidget {
  static const path = 'mobile_registration';
  @override
  State<StatefulWidget> createState() {
    return _MobileRegistrationState();
  }
}

class _MobileRegistrationState extends State<MobileRegistrationPage> {

  final BehaviorSubject<RegActionType?> _regController = BehaviorSubject();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: null,
      stream: _regController.stream,
      builder: _getPageView,
    );
  }

  PreferredSizeWidget _getBackButton(RegActionType type) {
    final title = type ==  RegActionType.email ? 'Enter email' : 'Enter mobile';
    return AppBar(
      title: Text(title, style: UIConstant.buttonTitleST),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings_power),
          onPressed: () {
            _regController.sink.add(null);
          },
        ),
      ],
    );
  }

  Widget _getPageView(BuildContext ctx, AsyncSnapshot<RegActionType?> data) {

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _shouldPop,
      child: Scaffold(
        appBar: data.data == null ? null : _getBackButton(data.data!),
        body: SafeArea(
          child: SingleChildScrollView(
            child: _getContent(data.data),
          ),
        ),
      ),
    );
  }

  void _shouldPop(bool didPop, Object? data) {

    final type = _regController.valueOrNull;
    if (type == null) {
      Navigator.of(context, rootNavigator: true).pop();
    } else {
      _regController.sink.add(null);
    }

  }

  Widget _getContent(RegActionType? type) {
    if (type == RegActionType.email) {
      return EmailView();
    }
    if (type == RegActionType.mobile) {
      return MobileView();
    }
    return RegistrationSelectionView(
      regTapController: _regController,
    );

  }

  void _onTapMobileOTP() {

  }

  void _onTapEmailOTP() {

  }
}