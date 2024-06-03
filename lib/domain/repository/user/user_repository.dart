import 'dart:async';

import 'package:app/domain/usecase/user/login_usecase.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';

import '../../entity/user/user.dart';

abstract class UserRepository {
  Future<User?> login(LoginParams params);

  Future<User?> register(RegisterParams params);

  Future<void> saveIsLoggedIn(bool value);

  Future<bool> get isLoggedIn;
}
