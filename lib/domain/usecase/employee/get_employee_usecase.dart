import 'package:app/core/domain/usecase/use_case.dart';
import 'package:app/domain/entity/employee/employee_list.dart';
import 'package:app/domain/repository/employee/employee_repository.dart';

class GetEmployeeUseCase extends UseCase<EmployeeList, void> {
  final EmployeeRepository _employeeRepository;

  GetEmployeeUseCase(this._employeeRepository);

  @override
  Future<EmployeeList> call({required params}) {
    return _employeeRepository.getEmployees();
  }
}
