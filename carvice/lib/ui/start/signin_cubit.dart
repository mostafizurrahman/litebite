import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignInState {}

class SignInUnknownState extends SignInState {}
class SignInLandingState extends SignInState {}

class SignInCompleteState extends SignInState {
  final String name;
  final String email;
  final String profile;

  SignInCompleteState({
    required this.name,
    required this.email,
    required this.profile,
  });
}

class SignInFailedState extends SignInState {
  final String reason;

  SignInFailedState({required this.reason});
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInUnknownState());

  Future<void> isSignedIn() async {
    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );
    try {
      if (await googleSignIn.isSignedIn()) {
        startSignIn();
      } else {
        emit(SignInLandingState());
      }
    } catch (error) {
      final state = SignInFailedState(reason: "Fail to sign in");
      print("Google Sign-In Error: $error");
      emit(state);
    }
  }

  Future<void> startSignIn() async {
    debugPrint('google sign in');

    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
    );
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        print("User canceled sign-in");
        final state = SignInFailedState(reason: "Fail to sign in");
        emit(state);
      } else {
        print("User Name: ${user.displayName}");
        print("User Email: ${user.email}");
        print("Profile Picture: ${user.photoUrl}");
        final state = SignInCompleteState(
          name: user.displayName ?? '',
          email: user.email,
          profile: user.photoUrl ?? '',
        );
        emit(state);
      }
    } catch (error) {
      final state = SignInFailedState(reason: "Fail to sign in");
      print("Google Sign-In Error: $error");
      emit(state);
    }
  }
}
