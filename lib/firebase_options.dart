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
    apiKey: 'AIzaSyBQh_2UPe8a9iHPPmNJCT_jZ4qadyxWfQA',
    appId: '1:352120622699:web:42a071ece902ff6ae96b2e',
    messagingSenderId: '352120622699',
    projectId: 'inf-todo',
    authDomain: 'inf-todo.firebaseapp.com',
    storageBucket: 'inf-todo.appspot.com',
    measurementId: 'G-TGPFL7G1DZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOzclpeM2s8D5BHnLLrKB5S4ozpG0f9iQ',
    appId: '1:352120622699:android:a3f5f6fcb6f4da7ee96b2e',
    messagingSenderId: '352120622699',
    projectId: 'inf-todo',
    storageBucket: 'inf-todo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkmkB_y0wFgV8kYyT9Eo8H4kimEv5OZsw',
    appId: '1:352120622699:ios:2be2dafacbba9f0ae96b2e',
    messagingSenderId: '352120622699',
    projectId: 'inf-todo',
    storageBucket: 'inf-todo.appspot.com',
    iosClientId: '352120622699-unvc1kdrd1nfac7p0hrsoje20d5ekpev.apps.googleusercontent.com',
    iosBundleId: 'com.example.inf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkmkB_y0wFgV8kYyT9Eo8H4kimEv5OZsw',
    appId: '1:352120622699:ios:25b2e71d9a9773b3e96b2e',
    messagingSenderId: '352120622699',
    projectId: 'inf-todo',
    storageBucket: 'inf-todo.appspot.com',
    iosClientId: '352120622699-jm76ugpt9t9j1re5opfhtl39jjh1b9bo.apps.googleusercontent.com',
    iosBundleId: 'com.example.inf.RunnerTests',
  );
}
