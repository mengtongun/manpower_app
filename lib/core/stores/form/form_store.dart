import 'package:app/core/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  _FormStore(this.formErrorStore, this.errorStore) {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => username, validateUsername),
      reaction((_) => email, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      username.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.email = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.email = 'Please enter a valid email address';
    } else {
      formErrorStore.email = null;
    }
  }

  @action
  void validateUsername(String value) {
    if (value.isEmpty) {
      formErrorStore.username = "Username can't be empty";
    } else if (value.length < 4) {
      formErrorStore.username = 'Username must be at-least 6 characters long';
    } else if (!isAlpha(value)) {
      formErrorStore.username = 'Please enter a valid username. example: testa';
    } else {
      formErrorStore.username = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doesn't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUsername(username);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInLogin => username != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      username != null ||
      email != null ||
      password != null ||
      confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => username != null;
}
