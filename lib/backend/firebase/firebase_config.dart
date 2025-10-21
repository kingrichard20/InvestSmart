import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBRrJ3Yc-j5CgmayDJ4kNNo4RdqhQreVyM",
            authDomain: "investsmart-aa9eb.firebaseapp.com",
            projectId: "investsmart-aa9eb",
            storageBucket: "investsmart-aa9eb.firebasestorage.app",
            messagingSenderId: "714333315441",
            appId: "1:714333315441:web:7613e8b7d0acbd631156d0",
            measurementId: "G-TRLQ13HNQM"));
  } else {
    await Firebase.initializeApp();
  }
}
