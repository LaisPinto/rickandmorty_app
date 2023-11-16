// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on BaseLoginStore, Store {
  late final _$loginModelAtom =
      Atom(name: 'BaseLoginStore.loginModel', context: context);

  @override
  LoginModel? get loginModel {
    _$loginModelAtom.reportRead();
    return super.loginModel;
  }

  @override
  set loginModel(LoginModel? value) {
    _$loginModelAtom.reportWrite(value, super.loginModel, () {
      super.loginModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'BaseLoginStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: 'BaseLoginStore.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$getLoginAsyncAction =
      AsyncAction('BaseLoginStore.getLogin', context: context);

  @override
  Future<bool> getLogin({required String username, required String password}) {
    return _$getLoginAsyncAction
        .run(() => super.getLogin(username: username, password: password));
  }

  @override
  String toString() {
    return '''
loginModel: ${loginModel},
isLoading: ${isLoading},
isPasswordVisible: ${isPasswordVisible}
    ''';
  }
}
