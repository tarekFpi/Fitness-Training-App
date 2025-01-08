// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3pNUZNh4XZq3SI1Tvg5hKCIZwUtAWGvQ',
    appId: '1:1091654290308:web:4c0b2b3a48dfbf4d932bd1',
    messagingSenderId: '1091654290308',
    projectId: 'tailaauth',
    authDomain: 'tailaauth.firebaseapp.com',
    storageBucket: 'tailaauth.firebasestorage.app',
    measurementId: 'G-QGH97WXNSD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt3Foz2MDZnDxWC4u2dFsh_sxEbA_k24s',
    appId: '1:1091654290308:android:28c05cb1dd610bd1932bd1',
    messagingSenderId: '1091654290308',
    projectId: 'tailaauth',
    storageBucket: 'tailaauth.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4pfQwcLo5UI9_5KKSe3rhlO_qq5JsJ1o',
    appId: '1:1091654290308:ios:976eea1478dc7fbb932bd1',
    messagingSenderId: '1091654290308',
    projectId: 'tailaauth',
    storageBucket: 'tailaauth.firebasestorage.app',
    androidClientId: '1091654290308-1g2fj0cbm63lakt4f4o3kbnh2vsidl5m.apps.googleusercontent.com',
    iosClientId: '1091654290308-792grqbhkurtohmdilfke19t8n5l56l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnessTrainingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4pfQwcLo5UI9_5KKSe3rhlO_qq5JsJ1o',
    appId: '1:1091654290308:ios:976eea1478dc7fbb932bd1',
    messagingSenderId: '1091654290308',
    projectId: 'tailaauth',
    storageBucket: 'tailaauth.firebasestorage.app',
    androidClientId: '1091654290308-1g2fj0cbm63lakt4f4o3kbnh2vsidl5m.apps.googleusercontent.com',
    iosClientId: '1091654290308-792grqbhkurtohmdilfke19t8n5l56l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.fitnessTrainingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3pNUZNh4XZq3SI1Tvg5hKCIZwUtAWGvQ',
    appId: '1:1091654290308:web:2cbb60f367658dee932bd1',
    messagingSenderId: '1091654290308',
    projectId: 'tailaauth',
    authDomain: 'tailaauth.firebaseapp.com',
    storageBucket: 'tailaauth.firebasestorage.app',
    measurementId: 'G-4YBTYZL5KR',
  );
}
