
# Flutter Registration Package

A comprehensive Flutter package for user authentication with multiple login methods, including Gmail, Apple ID, mobile OTP, email OTP, biometric authentication, and password recovery. This package simplifies the integration of common registration and login mechanisms into your app.

## Features

- **Login via Gmail**
- **Login via Apple ID**
- **Login via Mobile OTP**
- **Login via Email OTP**
- **Biometric Authentication (Face ID, Fingerprint)**
- **Forget Password (with recovery options)**

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_registration_package: ^1.0.0
```

Run `flutter pub get` to install the package.

## Usage

### 1. Login via Gmail

To enable Google sign-in, follow these steps:

1. **Install Google Sign-In Package:**

```bash
flutter pub add google_sign_in
```

2. **Setup Google Sign-In:**

   Add the required configuration for Google Sign-In in your project. Follow the official [Google Sign-In guide](https://pub.dev/packages/google_sign_in) for setup details.

3. **Code Example:**

```dart
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle() async {
  final GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    // Handle successful sign-in
  }
}
```

### 2. Login via Apple ID

To enable Apple Sign-In, follow these steps:

1. **Install Apple Sign-In Package:**

```bash
flutter pub add sign_in_with_apple
```

2. **Setup Apple Sign-In:**

   Follow the [Apple Sign-In guide](https://pub.dev/packages/sign_in_with_apple) to configure Apple login for iOS.

3. **Code Example:**

```dart
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> signInWithApple() async {
  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
  );
  // Handle successful sign-in
}
```

### 3. Login via Mobile OTP

To implement mobile OTP authentication:

1. **Install Firebase Auth Package:**

```bash
flutter pub add firebase_auth
```

2. **Setup Firebase Authentication:**

   Follow the official Firebase [Phone Authentication guide](https://firebase.flutter.dev/docs/auth/phone/) to set up OTP-based login.

3. **Code Example:**

```dart
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signInWithPhone(String phoneNumber) async {
  await _auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) {
      // Auto sign-in if phone number verification is completed automatically
    },
    verificationFailed: (FirebaseAuthException e) {
      // Handle error
    },
    codeSent: (String verificationId, int? resendToken) {
      // Handle OTP sent
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      // Handle time-out
    },
  );
}
```

### 4. Login via Email OTP

To enable email OTP authentication:

1. **Setup Email OTP:**

   You can use Firebase Authentication or your custom backend to send an OTP via email.

2. **Code Example:**

```dart
import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendEmailOTP(String email) async {
  // Use FirebaseAuth or custom email service to send OTP
}

Future<void> verifyEmailOTP(String email, String otp) async {
  // Verify OTP entered by the user
}
```

### 5. Biometric Authentication

To enable biometric authentication (Fingerprint, Face ID):

1. **Install Local Authentication Package:**

```bash
flutter pub add local_auth
```

2. **Code Example:**

```dart
import 'package:local_auth/local_auth.dart';

final LocalAuthentication auth = LocalAuthentication();

Future<void> authenticateWithBiometrics() async {
  bool didAuthenticate = await auth.authenticate(
    localizedReason: 'Please authenticate to sign in',
    biometricOnly: true,
  );

  if (didAuthenticate) {
    // Handle successful biometric authentication
  }
}
```

### 6. Forget Password

To implement password recovery options for each login method:

- **For Email-Based Logins (Gmail, Email OTP):**

```dart
import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendPasswordResetEmail(String email) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
}
```

- **For Mobile OTP Logins:**

   You can re-verify the mobile number with OTP to reset the user's password.

- **For Apple Sign-In:**

   Apple Sign-In uses the Apple ID, so the password is managed by the Apple ecosystem. Direct password resets are not applicable here.

### Example App

Check out the `example/` directory for a sample app demonstrating the usage of each authentication method.

## Requirements

- Google Sign-In setup for Android and iOS
- Apple Sign-In configured for iOS
- Firebase Authentication for Mobile OTP and Email OTP
- Local Authentication configured for biometric login

## Contributing

Feel free to open issues or submit pull requests to enhance the package.

## License

This package is licensed under the MIT License.
