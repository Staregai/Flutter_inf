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
    apiKey: 'AIzaSyCsaqsmhaI-JHvVdYl3HD7Fkcefo-5V6O8',
    appId: '1:230506841823:web:25a6fe021f8a5e00874b6a',
    messagingSenderId: '230506841823',
    projectId: 'todo-257f7',
    authDomain: 'todo-257f7.firebaseapp.com',
    storageBucket: 'todo-257f7.appspot.com',
    measurementId: 'G-VP41JBDH7C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUKjJjgBcsg6Zu9-IZ6gwTU_zMWOvqx-I',
    appId: '1:230506841823:android:21931ba969e0cefc874b6a',
    messagingSenderId: '230506841823',
    projectId: 'todo-257f7',
    storageBucket: 'todo-257f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdc9OJKPihp9khT-FaNGUk9a7rXf99zzo',
    appId: '1:230506841823:ios:d7367f7e4b41c212874b6a',
    messagingSenderId: '230506841823',
    projectId: 'todo-257f7',
    storageBucket: 'todo-257f7.appspot.com',
    iosBundleId: 'com.example.inf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdc9OJKPihp9khT-FaNGUk9a7rXf99zzo',
    appId: '1:230506841823:ios:fa8387beabea7db9874b6a',
    messagingSenderId: '230506841823',
    projectId: 'todo-257f7',
    storageBucket: 'todo-257f7.appspot.com',
    iosBundleId: 'com.example.inf.RunnerTests',
  );
}
