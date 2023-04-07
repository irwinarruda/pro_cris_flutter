import 'package:mobx/mobx.dart';
import 'package:pro_cris_flutter/entities/platform_user.dart';
import 'package:pro_cris_flutter/services/auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  late AuthService _authService;
  AuthControllerBase() {
    _authService = AuthService.getInstance();
    _authService.onProCrisUserChange(setProCrisUser);
  }

  @observable
  ProCrisUser? proCrisUser;

  @observable
  bool showSplash = true;

  @computed
  bool get isAuthenticated => proCrisUser != null;

  @action
  void setProCrisUser(ProCrisUser? user) {
    proCrisUser = user;
    showSplash = false;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    var user = await _authService.signIn(email: email, password: password);
    proCrisUser = user;
    await Future.delayed(Duration(milliseconds: 100));
  }

  Future<void> signOut() async {
    await _authService.signOut();
    proCrisUser = null;
    await Future.delayed(Duration(milliseconds: 100));
  }
}
