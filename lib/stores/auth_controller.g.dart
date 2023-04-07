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

  late final _$proCrisUserAtom =
      Atom(name: 'AuthControllerBase.proCrisUser', context: context);

  @override
  ProCrisUser? get proCrisUser {
    _$proCrisUserAtom.reportRead();
    return super.proCrisUser;
  }

  @override
  set proCrisUser(ProCrisUser? value) {
    _$proCrisUserAtom.reportWrite(value, super.proCrisUser, () {
      super.proCrisUser = value;
    });
  }

  late final _$showSplashAtom =
      Atom(name: 'AuthControllerBase.showSplash', context: context);

  @override
  bool get showSplash {
    _$showSplashAtom.reportRead();
    return super.showSplash;
  }

  @override
  set showSplash(bool value) {
    _$showSplashAtom.reportWrite(value, super.showSplash, () {
      super.showSplash = value;
    });
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void setProCrisUser(ProCrisUser? user) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setProCrisUser');
    try {
      return super.setProCrisUser(user);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
proCrisUser: ${proCrisUser},
showSplash: ${showSplash},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
