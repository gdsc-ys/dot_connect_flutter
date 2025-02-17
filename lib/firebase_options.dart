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
    apiKey: 'AIzaSyBioGs4RG3d5IynQAvfUc4dPfzA3XgK-do',
    appId: '1:758270948258:web:e052a7c7a51a4b59fe38fb',
    messagingSenderId: '758270948258',
    projectId: 'dot-connect-374203',
    authDomain: 'dot-connect-374203.firebaseapp.com',
    storageBucket: 'dot-connect-374203.appspot.com',
    measurementId: 'G-PW6PR2687X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5M_dgEn6QYAi9xyvV1WDm2MZIZ1Pfr2o',
    appId: '1:758270948258:android:f87e276ae1c8509afe38fb',
    messagingSenderId: '758270948258',
    projectId: 'dot-connect-374203',
    storageBucket: 'dot-connect-374203.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv1wLpsXYlwiKnI7NChffjGhodFIHSVMg',
    appId: '1:758270948258:ios:f209f63de9d0ffe4fe38fb',
    messagingSenderId: '758270948258',
    projectId: 'dot-connect-374203',
    storageBucket: 'dot-connect-374203.appspot.com',
    iosClientId: '758270948258-jmqsgke3aqkfgc5bjh3qod5c6fton86p.apps.googleusercontent.com',
    iosBundleId: 'com.example.dotConnectFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv1wLpsXYlwiKnI7NChffjGhodFIHSVMg',
    appId: '1:758270948258:ios:f209f63de9d0ffe4fe38fb',
    messagingSenderId: '758270948258',
    projectId: 'dot-connect-374203',
    storageBucket: 'dot-connect-374203.appspot.com',
    iosClientId: '758270948258-jmqsgke3aqkfgc5bjh3qod5c6fton86p.apps.googleusercontent.com',
    iosBundleId: 'com.example.dotConnectFlutter',
  );
}
