import 'package:app/core/stores/error/error_store.dart';
import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/entity/employee/employee_list.dart';
import 'package:app/domain/usecase/employee/export_employee_usecase.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';
import 'package:app/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecase/employee/get_employee_usecase.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  // constructor:---------------------------------------------------------------
  _EmployeeStore(this._getEmployeeUseCase, this._updateEmployeeUseCase,
      this._exportEmployeeUseCase, this.errorStore);

  // use cases:-----------------------------------------------------------------
  final GetEmployeeUseCase _getEmployeeUseCase;
  final UpdateEmployeeUseCase _updateEmployeeUseCase;
  final ExportEmployeeUseCase _exportEmployeeUseCase;

  // stores:--------------------------------------------------------------------
  // store for handling errors
  final ErrorStore errorStore;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<EmployeeList?> emptyEmployeeResponse =
      ObservableFuture.value(null);
  static ObservableFuture<Employee?> emptyUpdateEmployeeResponse =
      ObservableFuture.value(null);
  static ObservableFuture<String?> emptyExportEmployeeResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<EmployeeList?> fetchEmployeesFuture =
      ObservableFuture<EmployeeList?>(emptyEmployeeResponse);

  @observable
  ObservableFuture<Employee?> updateEmployeesFuture =
      ObservableFuture<Employee?>(emptyUpdateEmployeeResponse);

  @observable
  ObservableFuture<String?> exportEmployeesFuture =
      ObservableFuture<String?>(emptyExportEmployeeResponse);

  @observable
  EmployeeList? employeeList;

  @computed
  bool get loading => fetchEmployeesFuture.status == FutureStatus.pending;

  @computed
  bool get loadingUpdate =>
      updateEmployeesFuture.status == FutureStatus.pending;

  @computed
  bool get loadingExport =>
      exportEmployeesFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getEmployees() async {
    final future = _getEmployeeUseCase.call(params: null);
    fetchEmployeesFuture = ObservableFuture(future);

    future.then((employeeList) {
      this.employeeList = employeeList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future updateEmployees(UpdateEmployeeParams params) async {
    final future = _updateEmployeeUseCase.call(params: params);
    updateEmployeesFuture = ObservableFuture(future);
    await future.then((_) {}).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
    await _getEmployeeUseCase.call(params: null).then((employeeList) {
      this.employeeList = employeeList;
    });
  }

  @action
  Future exportEmployees() async {
    final future = _exportEmployeeUseCase.call(params: null);
    exportEmployeesFuture = ObservableFuture(future);

    await future.then((_) {}).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
