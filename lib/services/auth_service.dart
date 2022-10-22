import 'package:firebase_auth/firebase_auth.dart';

import 'package:pro_cris_flutter/entities/platform_user.dart';

class AuthService {
  static final AuthService _instance = AuthService();
  static AuthService getInstance() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  PlatformUser? get currentPlatformUser =>
      _platformUserFromFirebase(_auth.currentUser!);

  PlatformUser? _platformUserFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
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
      callback(_platformUserFromFirebase(user));
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
