import 'package:firebase_auth/firebase_auth.dart';

import 'package:pro_cris_flutter/entities/platform_user.dart';

class AuthService {
  static final AuthService _instance = AuthService();
  static getInstance() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  PlatformUser _platformUserFromFirebase(User user) {
    return PlatformUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
      avatar: user.photoURL ?? '',
    );
  }

  void listenToPlatformUserChange(void Function(PlatformUser?) callback) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        callback(_platformUserFromFirebase(user));
      } else {
        callback(null);
      }
    });
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
