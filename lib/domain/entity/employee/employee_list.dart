import 'package:app/domain/entity/employee/employee.dart';

class EmployeeList {
  late final List<Employee>? employees;

  EmployeeList({
    this.employees,
  });

  factory EmployeeList.fromJson(List<dynamic> json) {
    List<Employee> employees = <Employee>[];
    employees = json.map((employee) => Employee.fromMap(employee)).toList();

    return EmployeeList(
      employees: employees,
    );
  }
}
