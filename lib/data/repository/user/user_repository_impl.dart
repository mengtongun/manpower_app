import 'dart:convert';

import 'package:app/data/network/apis/users/user_api.dart';
import 'package:app/domain/repository/user/user_repository.dart';
import 'package:app/data/sharedpref/shared_preference_helper.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/login_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefHelper;

  // api objects
  final UserApi _userApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefHelper, this._userApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<User?> login(LoginParams params) async {
    User? user = await this._userApi.login(params);
    if (user.isActive!) {
      saveBasicAuth(params.password, user);
      return user;
    }
    return null;
  }

  User saveBasicAuth(String password, User user) {
    String savedPassword = password;
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('${user.username}:${savedPassword}'));
    _sharedPrefHelper.saveAuthToken(basicAuth);
    return user;
  }

  // Register:------------------------------------------------------------------
  @override
  Future<User?> register(RegisterParams params) async {
    return await this._userApi.register(params);
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefHelper.isLoggedIn;
}
