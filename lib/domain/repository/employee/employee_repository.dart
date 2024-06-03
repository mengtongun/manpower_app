import 'dart:async';

import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/entity/employee/employee_list.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';

abstract class EmployeeRepository {
  Future<EmployeeList> getEmployees();
  Future<String?> exportEmployee();
  Future<Employee?> update(UpdateEmployeeParams employee);
}
