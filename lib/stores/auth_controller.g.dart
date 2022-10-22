// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: 'AuthControllerBase.isAuthenticated'))
          .value;

  late final _$platformUserAtom =
      Atom(name: 'AuthControllerBase.platformUser', context: context);

  @override
  PlatformUser? get platformUser {
    _$platformUserAtom.reportRead();
    return super.platformUser;
  }

  @override
  set platformUser(PlatformUser? value) {
    _$platformUserAtom.reportWrite(value, super.platformUser, () {
      super.platformUser = value;
    });
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void setPlatformUser(PlatformUser? user) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setPlatformUser');
    try {
      return super.setPlatformUser(user);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
platformUser: ${platformUser},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
