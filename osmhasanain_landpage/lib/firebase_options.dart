// lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
        'DefaultFirebaseOptions are not supported on this platform');
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyBXOD3PJhAtpoyNFJtE4-o7j0XyDbhUT34",
      authDomain: "osmhasanain-landpage.firebaseapp.com",
      projectId: "osmhasanain-landpage",
      storageBucket: "osmhasanain-landpage.firebasestorage.app",
      messagingSenderId: "256246401705",
      appId: "1:256246401705:web:6c3d1d2307bc96ab6bf7b8",
      measurementId: "G-DP97JKZ2ZW");
}
