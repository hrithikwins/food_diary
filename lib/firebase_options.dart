// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA6280RF-F1xdnnnTmAe6WV619sOGM4RHk',
    appId: '1:926528522271:web:b1b8f7a859775600b82d2a',
    messagingSenderId: '926528522271',
    projectId: 'food-diary-g',
    authDomain: 'food-diary-g.firebaseapp.com',
    storageBucket: 'food-diary-g.appspot.com',
    measurementId: 'G-53T6PYNXFX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkRuyDsPkUI79XjkcK9bTDsEHvAoV5x1I',
    appId: '1:926528522271:android:a5cfa0d33c51bfa3b82d2a',
    messagingSenderId: '926528522271',
    projectId: 'food-diary-g',
    storageBucket: 'food-diary-g.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiWHESLd9niu02g13Vx2h6HEK-pCtAOwI',
    appId: '1:926528522271:ios:66efe78183101aeeb82d2a',
    messagingSenderId: '926528522271',
    projectId: 'food-diary-g',
    storageBucket: 'food-diary-g.appspot.com',
    androidClientId: '926528522271-abvfkktamk5le21fg67n47a4d9urpt3m.apps.googleusercontent.com',
    iosClientId: '926528522271-h92k2b3pra3rt69vq0eohu39nisd0id3.apps.googleusercontent.com',
    iosBundleId: 'com.food.ga',
  );
}
