// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_FormStore.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_FormStore.canRegister'))
          .value;

  late final _$usernameAtom =
      Atom(name: '_FormStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom = Atom(name: '_FormStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$successAtom = Atom(name: '_FormStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
success: ${success},
canLogin: ${canLogin},
canRegister: ${canRegister}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;

  late final _$usernameAtom =
      Atom(name: '_FormErrorStore.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormErrorStore.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
