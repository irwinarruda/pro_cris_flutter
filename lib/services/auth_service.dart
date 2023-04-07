import 'package:firebase_auth/firebase_auth.dart';

import 'package:pro_cris_flutter/entities/platform_user.dart';

class AuthService {
  static final AuthService _instance = AuthService();
  static AuthService getInstance() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProCrisUser? get currentProCrisUser =>
      _proCrisUserFromFirebase(_auth.currentUser!);

  ProCrisUser? _proCrisUserFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return ProCrisUser(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
      avatar: user.photoURL ?? '',
    );
  }

  void onProCrisUserChange(void Function(ProCrisUser?) callback) {
    _auth.authStateChanges().listen((user) {
      callback(_proCrisUserFromFirebase(user));
    });
  }

  Future<ProCrisUser?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var userCredentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _proCrisUserFromFirebase(userCredentials.user);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
