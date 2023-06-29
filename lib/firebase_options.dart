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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_Z9nR7jHi2Rw7b-Ery2yqyTcw_hpw8Ig',
    appId: '1:365206175432:android:118437aa6f543459cbaffd',
    messagingSenderId: '365206175432',
    projectId: 'oh-my-gym-app-52de9',
    storageBucket: 'oh-my-gym-app-52de9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpfC-CDHbIscOAN8mgd7PjaB6qU0Dv9Dw',
    appId: '1:365206175432:ios:152db2ff3b1a9646cbaffd',
    messagingSenderId: '365206175432',
    projectId: 'oh-my-gym-app-52de9',
    storageBucket: 'oh-my-gym-app-52de9.appspot.com',
    iosClientId: '365206175432-92ovlv3f885tf1spakp07lc114cls2e5.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.oh-my-gym-app.dev',
  );
}
