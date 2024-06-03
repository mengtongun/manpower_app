import 'package:app/core/domain/usecase/use_case.dart';
import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/repository/employee/employee_repository.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_employee_usecase.g.dart';

@JsonSerializable()
class UpdateEmployeeParams extends Employee {
  final String? manpowerId;
  final String? designation;
  final String? project;
  final String? team;
  final String? supervisor;
  final String? joinDate;
  final String? resignDate;
  UpdateEmployeeParams(
      {this.manpowerId,
      this.designation,
      this.project,
      this.team,
      this.supervisor,
      this.joinDate,
      this.resignDate});

  factory UpdateEmployeeParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmployeeParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEmployeeParamsToJson(this);
}

class UpdateEmployeeUseCase extends UseCase<Employee?, UpdateEmployeeParams> {
  final EmployeeRepository _employeeRepository;

  UpdateEmployeeUseCase(this._employeeRepository);

  @override
  Future<Employee?> call({required params}) {
    return _employeeRepository.update(params);
  }
}
