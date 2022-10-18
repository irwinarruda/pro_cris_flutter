import 'package:mobx/mobx.dart';
import 'package:pro_cris_flutter/entities/platform_user.dart';
import 'package:pro_cris_flutter/services/auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  late AuthService _authService;
  AuthControllerBase() {
    _authService = AuthService.getInstance();
    _authService.listenToPlatformUserChange(setPlatformUser);
  }

  @observable
  PlatformUser? platformUser;

  @action
  void setPlatformUser(PlatformUser? user) => platformUser = user;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _authService.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
