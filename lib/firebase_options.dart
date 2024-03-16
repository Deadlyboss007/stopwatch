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
    apiKey: 'AIzaSyBZO16nXmK4rXMYWX7JQT3fvsDgJGdbSOU',
    appId: '1:646374739944:web:3273c045d4bc09db6e9e5d',
    messagingSenderId: '646374739944',
    projectId: 'charge-it-8b148',
    authDomain: 'charge-it-8b148.firebaseapp.com',
    databaseURL: 'https://charge-it-8b148-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'charge-it-8b148.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSoF1o1d48hXhKW1S-2lvR1A_M9Q3m98M',
    appId: '1:646374739944:android:4b84fd1cee557f256e9e5d',
    messagingSenderId: '646374739944',
    projectId: 'charge-it-8b148',
    databaseURL: 'https://charge-it-8b148-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'charge-it-8b148.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXBpQvHTAftI-Bfl2cMF3dXmbx0tt3G3Y',
    appId: '1:646374739944:ios:b31a4d0b8a9072c56e9e5d',
    messagingSenderId: '646374739944',
    projectId: 'charge-it-8b148',
    databaseURL: 'https://charge-it-8b148-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'charge-it-8b148.appspot.com',
    iosBundleId: 'com.example.stopwatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXBpQvHTAftI-Bfl2cMF3dXmbx0tt3G3Y',
    appId: '1:646374739944:ios:f273750e8dc5ba8a6e9e5d',
    messagingSenderId: '646374739944',
    projectId: 'charge-it-8b148',
    databaseURL: 'https://charge-it-8b148-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'charge-it-8b148.appspot.com',
    iosBundleId: 'com.example.stopwatch.RunnerTests',
  );
}
