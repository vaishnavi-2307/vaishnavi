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
    apiKey: 'AIzaSyAFqS3J1TGcuw9wDEOyqE-xYFm7Kx4HOZY',
    appId: '1:499409594228:web:56be0fbd0b5b0f081cae21',
    messagingSenderId: '499409594228',
    projectId: 'meta-academie',
    authDomain: 'meta-academie.firebaseapp.com',
    storageBucket: 'meta-academie.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcecPA-2VV0XGdC8hOCDgYqsMb1DxI4B4',
    appId: '1:499409594228:android:1f04709a57c13c821cae21',
    messagingSenderId: '499409594228',
    projectId: 'meta-academie',
    storageBucket: 'meta-academie.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQiwFeoVFbNfBEae5fCYVE6LtRTdiiWxo',
    appId: '1:499409594228:ios:2f824d67deca78e21cae21',
    messagingSenderId: '499409594228',
    projectId: 'meta-academie',
    storageBucket: 'meta-academie.appspot.com',
    iosBundleId: 'com.example.metabizserv',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQiwFeoVFbNfBEae5fCYVE6LtRTdiiWxo',
    appId: '1:499409594228:ios:93cc7c358bc4f0371cae21',
    messagingSenderId: '499409594228',
    projectId: 'meta-academie',
    storageBucket: 'meta-academie.appspot.com',
    iosBundleId: 'com.example.metabizserv.RunnerTests',
  );
}
