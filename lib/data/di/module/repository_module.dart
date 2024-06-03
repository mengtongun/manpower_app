import 'dart:async';

import 'package:app/data/network/apis/employees/employee_api.dart';
import 'package:app/data/network/apis/users/user_api.dart';
import 'package:app/data/repository/employee/employee_repository_impl.dart';
import 'package:app/data/repository/setting/setting_repository_impl.dart';
import 'package:app/data/repository/user/user_repository_impl.dart';
import 'package:app/data/sharedpref/shared_preference_helper.dart';
import 'package:app/domain/repository/employee/employee_repository.dart';
import 'package:app/domain/repository/setting/setting_repository.dart';
import 'package:app/domain/repository/user/user_repository.dart';

import '../../../di/service_locator.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<SettingRepository>(SettingRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
      getIt<UserApi>(),
    ));

    getIt.registerSingleton<EmployeeRepository>(EmployeeRepositoryImpl(
      getIt<EmployeeApi>(),
    ));
  }
}
