// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAex3LKTCPPXpNkhFr5vVLtse0ixCl0-Hg',
    appId: '1:122823192551:web:894bc256207a9218e31742',
    messagingSenderId: '122823192551',
    projectId: 'call-safe',
    authDomain: 'call-safe.firebaseapp.com',
    storageBucket: 'call-safe.appspot.com',
    measurementId: 'G-7ET8HMN1HK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsNfELqsEZRbifU27MNwf9ZHkNl4LsMnk',
    appId: '1:122823192551:android:0dc3a5f55e78d698e31742',
    messagingSenderId: '122823192551',
    projectId: 'call-safe',
    storageBucket: 'call-safe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOAVcYKhPlLTcAddrC6qd8KWGLSDZLKOM',
    appId: '1:122823192551:ios:cefbb47e23c62e46e31742',
    messagingSenderId: '122823192551',
    projectId: 'call-safe',
    storageBucket: 'call-safe.appspot.com',
    iosBundleId: 'com.example.callSafe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOAVcYKhPlLTcAddrC6qd8KWGLSDZLKOM',
    appId: '1:122823192551:ios:b19e6d7049bcbdcce31742',
    messagingSenderId: '122823192551',
    projectId: 'call-safe',
    storageBucket: 'call-safe.appspot.com',
    iosBundleId: 'com.example.callSafe.RunnerTests',
  );
}