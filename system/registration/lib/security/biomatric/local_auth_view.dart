import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:collection/collection.dart';

enum LoginType{
  local,
  internet,
}

class LocalAuthView extends StatefulWidget{
  final StreamController<LoginType> loginSwitcher;
  const LocalAuthView({super.key, required this.loginSwitcher,});

  @override
  State<StatefulWidget> createState() {
    return _LocalAuthState();
  }
}

class _LocalAuthState extends State<LocalAuthView> {

  final _localAuth = LocalAuthentication();
  static const _faceAsset = 'lib/assets/startup/face-scan.svg';
  static const _faceTitle = 'Login With Face';
  static const _fingerAsset = 'lib/assets/startup/finger.svg';
  static const _fingerTitle = 'Use Finger Print';
// LocalAuthentication  final StreamController _authAvailable = StreamController();
//   _SupportState _supportState = _SupportState.unknown;
//   bool _canCheckBiometrics = false;
//   List<BiometricType>? _availableBiometrics;
//   bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<BiometricType>>(
      future: _getAuthStatus(),
      builder: _getAuthStatusView,
    );
  }

  Future<List<BiometricType>> _getAuthStatus() async {
    final isSupported = await _localAuth.isDeviceSupported();
    if (isSupported) {
      try {
        final canCheck = await _localAuth.canCheckBiometrics;
        if (canCheck) {
          final biometrics = await _localAuth.getAvailableBiometrics();
          return biometrics;
        }
      } on PlatformException catch (e) {
        debugPrint(e.message);
      }
    }
    return [];
  }

  Widget _getAuthStatusView(
      BuildContext ctx,
      AsyncSnapshot<List<BiometricType>> futureSnap,
      ) {
    if (futureSnap.data?.isNotEmpty ?? false) {
      final face = futureSnap.data!.firstWhereOrNull(
            (element) => element == BiometricType.face,
      );
      final finger = futureSnap.data!.firstWhereOrNull(
            (element) => element == BiometricType.fingerprint,
      );
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (face != null) _getTapInk(face, _faceAsset, _faceTitle),
          if (finger != null) _getTapInk(finger, _fingerAsset, _fingerTitle),
        ],
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getTapInk(
      final BiometricType type,
      final String asset,
      final String title,
      ) {
    return Container(
      decoration: CCAppTheme.shadowDec,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: InkWidget(
          content: Column(
            children: [
              const SizedBox(height: 24),
              SvgPicture.asset(
                asset,
                width: 70,
                height: 70,
              ),
              const SizedBox(height: 12),
              Text(title),
            ],
          ),
          onTap: () => _startBioMetric(type),
          dimension: 140,
        ),
      ),
    );
  }

  Future<void> _startBioMetric(BiometricType type) async {
    try {
      final authenticated = await _localAuth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        widget.loginSwitcher.sink.add(LoginType.internet);
        debugPrint('done authentication with success');
      } else {
        debugPrint('authentication fail');
      }
    } on PlatformException catch (_) {
      if (type != BiometricType.weak) {
        _startBioMetric(BiometricType.weak);
      }
    }
  }
}