import 'dart:async';

import 'package:app/data/network/apis/employees/employee_api.dart';
import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/entity/employee/employee_list.dart';
import 'package:app/domain/repository/employee/employee_repository.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  // api objects
  final EmployeeApi _employeeApi;

  // constructor
  EmployeeRepositoryImpl(this._employeeApi);

  @override
  Future<EmployeeList> getEmployees() async {
    return await _employeeApi.getEmployees().catchError((error) => throw error);
  }

  @override
  Future<Employee?> update(UpdateEmployeeParams employee) async {
    return await _employeeApi
        .updateEmployee(employee)
        .catchError((error) => throw error);
  }

  @override
  Future<String?> exportEmployee() async {
    return await _employeeApi.exportCSV().catchError((error) => throw error);
  }
}
