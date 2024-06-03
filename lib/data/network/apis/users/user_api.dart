import 'dart:async';

import 'package:app/data/network/constants/endpoints.dart';
import 'package:app/core/data/network/dio/dio_client.dart';
import 'package:app/domain/entity/user/user.dart';
import 'package:app/domain/usecase/user/login_usecase.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  UserApi(this._dioClient);

  Future<User> login(LoginParams data) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.login, data: data.toJson());
      return User.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<User> register(RegisterParams data) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.register, data: data.toJson());
      return User.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
