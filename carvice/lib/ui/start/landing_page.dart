import 'dart:io';

import 'package:carvice/config/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uisystem/uisystem.dart';

import '../home/home_page.dart';
import '../utility/ui_builder.dart';
import '../widgets/image_widget.dart';
import 'signin_cubit.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LandingState();
  }
}

class _LandingState extends State<LandingPage> {
  final _signInCubit = SignInCubit();

  @override
  void initState() {
    super.initState();WidgetsBinding.instance.addPostFrameCallback( _startInit);
  }

  void _startInit(_){
    _signInCubit.isSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        title: Text(
          localization.getText(key: 'app_name'),
          style: UITextTheme.tsAppBar,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer(
          builder: _onSignInStatusView,
          bloc: _signInCubit,
          listener: _onChangeSignState,
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

  void _onChangeSignState(BuildContext context, SignInState data) {
    if (data is SignInCompleteState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),  // Replace with your desired screen
      );
    }
  }

  Widget _onSignInStatusView(BuildContext context, SignInState state) {
    return _getWelcomeLogin(isLanding: state is SignInLandingState);
  }

  Widget _getWelcomeLogin({required bool isLanding}) {
    final widgets = _getInfoViews();
    if (isLanding) {
      widgets.add(const SizedBox(height: 24));
      widgets.add(
        TapWidget(
          title: 'Sign in With Google',
          iconData: Icons.mail,
          width: UIBuilder.width(context: context) - 48,
          onTapWidget: _startGoogleSignIn,
        ),
      );
      widgets.addAll(_getAppleSignIn());
    } else {

      widgets.add(const SizedBox(height: 24));
      widgets.add(
       const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(width: 12),
            Text('Loading Sign-in...'),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: widgets,
      ),
    );
  }


  List<Widget> _getInfoViews() {
    final title = localization.getText(key: 'title_landing');
    final subtitle = localization.getText(key: 'subtitle_landing');
    return [
      Row(
        children: [
          Expanded(child: ImageWidget.svgWidget),
        ],
      ),
      const SizedBox(height: 24),
      Text(title, style: UITextTheme.tsTitle),
      const SizedBox(height: 16),
      Text(subtitle, style: UITextTheme.ts14Normal),
    ];
  }

  List<Widget> _getAppleSignIn() {
    if (Platform.isIOS) {
      return [
        const SizedBox(height: 24),
        TapWidget(
          title: 'Sign in With Apple',
          iconData: Icons.apple,
          width: UIBuilder.width(context: context) - 48,
          onTapWidget: _startAppleSignIn,
        ),
      ];
    }
    return [];
  }

  Future<void> _startGoogleSignIn() async {
    _signInCubit.startSignIn();
  }

  void _startAppleSignIn() {
    debugPrint('apple sign in');
  }

  @override
  void dispose() {
    _signInCubit.close();
    super.dispose();
  }
}
