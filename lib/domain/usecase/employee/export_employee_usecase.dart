import 'package:app/core/domain/usecase/use_case.dart';
import 'package:app/domain/repository/employee/employee_repository.dart';

class ExportEmployeeUseCase extends UseCase<String?, String?> {
  final EmployeeRepository _employeeRepository;

  ExportEmployeeUseCase(this._employeeRepository);

  @override
  Future<String?> call({params}) {
    return _employeeRepository.exportEmployee();
  }
}
