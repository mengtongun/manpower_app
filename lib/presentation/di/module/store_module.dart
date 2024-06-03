import 'dart:async';

import 'package:app/core/stores/error/error_store.dart';
import 'package:app/core/stores/form/form_store.dart';
import 'package:app/domain/repository/setting/setting_repository.dart';
import 'package:app/domain/usecase/employee/export_employee_usecase.dart';
import 'package:app/domain/usecase/employee/get_employee_usecase.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';
import 'package:app/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:app/domain/usecase/user/login_usecase.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';
import 'package:app/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:app/presentation/employee/store/employee_store.dart';
import 'package:app/presentation/home/store/language/language_store.dart';
import 'package:app/presentation/home/store/theme/theme_store.dart';
import 'package:app/presentation/login/store/user/user_store.dart';

import '../../../di/service_locator.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    getIt.registerFactory(() => ErrorStore());
    getIt.registerFactory(() => FormErrorStore());
    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
        getIt<IsLoggedInUseCase>(),
        getIt<SaveLoginStatusUseCase>(),
        getIt<LoginUseCase>(),
        getIt<RegisterUseCase>(),
        getIt<FormErrorStore>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<EmployeeStore>(
      EmployeeStore(
        getIt<GetEmployeeUseCase>(),
        getIt<UpdateEmployeeUseCase>(),
        getIt<ExportEmployeeUseCase>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<ThemeStore>(
      ThemeStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<LanguageStore>(
      LanguageStore(
        getIt<SettingRepository>(),
        getIt<ErrorStore>(),
      ),
    );
  }
}
