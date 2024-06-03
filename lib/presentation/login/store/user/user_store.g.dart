// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_UserStore.isLoading'))
      .value;

  late final _$loginSuccessAtom =
      Atom(name: '_UserStore.loginSuccess', context: context);

  @override
  bool get loginSuccess {
    _$loginSuccessAtom.reportRead();
    return super.loginSuccess;
  }

  @override
  set loginSuccess(bool value) {
    _$loginSuccessAtom.reportWrite(value, super.loginSuccess, () {
      super.loginSuccess = value;
    });
  }

  late final _$registerSuccessAtom =
      Atom(name: '_UserStore.registerSuccess', context: context);

  @override
  bool get registerSuccess {
    _$registerSuccessAtom.reportRead();
    return super.registerSuccess;
  }

  @override
  set registerSuccess(bool value) {
    _$registerSuccessAtom.reportWrite(value, super.registerSuccess, () {
      super.registerSuccess = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_UserStore.loginFuture', context: context);

  @override
  ObservableFuture<User?> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<User?> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$registerFutureAtom =
      Atom(name: '_UserStore.registerFuture', context: context);

  @override
  ObservableFuture<User?> get registerFuture {
    _$registerFutureAtom.reportRead();
    return super.registerFuture;
  }

  @override
  set registerFuture(ObservableFuture<User?> value) {
    _$registerFutureAtom.reportWrite(value, super.registerFuture, () {
      super.registerFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<dynamic> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('_UserStore.register', context: context);

  @override
  Future<dynamic> register(String username, String email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(username, email, password));
  }

  @override
  String toString() {
    return '''
loginSuccess: ${loginSuccess},
registerSuccess: ${registerSuccess},
loginFuture: ${loginFuture},
registerFuture: ${registerFuture},
isLoading: ${isLoading}
    ''';
  }
}
