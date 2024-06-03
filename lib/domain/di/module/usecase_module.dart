import 'package:app/domain/repository/employee/employee_repository.dart';
import 'package:app/domain/repository/user/user_repository.dart';
import 'package:app/domain/usecase/employee/export_employee_usecase.dart';
import 'package:app/domain/usecase/employee/get_employee_usecase.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';
import 'package:app/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:app/domain/usecase/user/login_usecase.dart';
import 'package:app/domain/usecase/user/register_usecase.dart';
import 'package:app/domain/usecase/user/save_login_in_status_usecase.dart';

import '../../../di/service_locator.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    getIt.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<RegisterUseCase>(
      RegisterUseCase(getIt<UserRepository>()),
    );

    // employees:--------------------------------------------------------------------
    getIt.registerSingleton<GetEmployeeUseCase>(
      GetEmployeeUseCase(getIt<EmployeeRepository>()),
    );
    getIt.registerSingleton<UpdateEmployeeUseCase>(
      UpdateEmployeeUseCase(getIt<EmployeeRepository>()),
    );
    getIt.registerSingleton<ExportEmployeeUseCase>(
      ExportEmployeeUseCase(getIt<EmployeeRepository>()),
    );
  }
}
