import 'package:app/core/stores/error/error_store.dart';
import 'package:app/core/stores/form/form_store.dart';
import 'package:app/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';
import 'package:app/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:app/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/entity/user/user.dart';
import '../../../../domain/usecase/user/login_usecase.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(
    this._isLoggedInUseCase,
    this._saveLoginStatusUseCase,
    this._loginUseCase,
    this._registerUseCase,
    this.formErrorStore,
    this.errorStore,
  ) {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
  }

  // use cases:-----------------------------------------------------------------
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  // stores:--------------------------------------------------------------------
  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => loginSuccess, (_) => loginSuccess = false, delay: 200),
      reaction((_) => registerSuccess, (_) => registerSuccess = false,
          delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<User?> emptyLoginResponse =
      ObservableFuture.value(null);

  static ObservableFuture<User?> emptyRegisterResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  bool isLoggedIn = false;

  @observable
  bool loginSuccess = false;

  @observable
  bool registerSuccess = false;

  @observable
  ObservableFuture<User?> loginFuture = emptyLoginResponse;

  @observable
  ObservableFuture<User?> registerFuture = emptyRegisterResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String username, String password) async {
    final LoginParams loginParams =
        LoginParams(username: username.toLowerCase(), password: password);
    final future = _loginUseCase.call(params: loginParams);
    loginFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        await _saveLoginStatusUseCase.call(params: true);
        this.isLoggedIn = true;
        this.loginSuccess = true;
      }
    }).catchError((e) {
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      this.loginSuccess = false;
    });
  }

  // actions:-------------------------------------------------------------------
  @action
  Future register(String username, String email, String password) async {
    final RegisterParams registerParams = RegisterParams(
        username: username.toLowerCase(),
        email: email.toLowerCase(),
        password: password);
    final future = _registerUseCase.call(params: registerParams);
    registerFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        this.registerSuccess = true;
      }
    }).catchError((e) {
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      this.registerSuccess = false;
    });
  }

  logout() async {
    this.isLoggedIn = false;
    await _saveLoginStatusUseCase.call(params: false);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
