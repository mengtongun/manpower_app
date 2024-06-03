// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeeStore on _EmployeeStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_EmployeeStore.loading'))
      .value;
  Computed<bool>? _$loadingUpdateComputed;

  @override
  bool get loadingUpdate =>
      (_$loadingUpdateComputed ??= Computed<bool>(() => super.loadingUpdate,
              name: '_EmployeeStore.loadingUpdate'))
          .value;
  Computed<bool>? _$loadingExportComputed;

  @override
  bool get loadingExport =>
      (_$loadingExportComputed ??= Computed<bool>(() => super.loadingExport,
              name: '_EmployeeStore.loadingExport'))
          .value;

  late final _$fetchEmployeesFutureAtom =
      Atom(name: '_EmployeeStore.fetchEmployeesFuture', context: context);

  @override
  ObservableFuture<EmployeeList?> get fetchEmployeesFuture {
    _$fetchEmployeesFutureAtom.reportRead();
    return super.fetchEmployeesFuture;
  }

  @override
  set fetchEmployeesFuture(ObservableFuture<EmployeeList?> value) {
    _$fetchEmployeesFutureAtom.reportWrite(value, super.fetchEmployeesFuture,
        () {
      super.fetchEmployeesFuture = value;
    });
  }

  late final _$updateEmployeesFutureAtom =
      Atom(name: '_EmployeeStore.updateEmployeesFuture', context: context);

  @override
  ObservableFuture<Employee?> get updateEmployeesFuture {
    _$updateEmployeesFutureAtom.reportRead();
    return super.updateEmployeesFuture;
  }

  @override
  set updateEmployeesFuture(ObservableFuture<Employee?> value) {
    _$updateEmployeesFutureAtom.reportWrite(value, super.updateEmployeesFuture,
        () {
      super.updateEmployeesFuture = value;
    });
  }

  late final _$exportEmployeesFutureAtom =
      Atom(name: '_EmployeeStore.exportEmployeesFuture', context: context);

  @override
  ObservableFuture<String?> get exportEmployeesFuture {
    _$exportEmployeesFutureAtom.reportRead();
    return super.exportEmployeesFuture;
  }

  @override
  set exportEmployeesFuture(ObservableFuture<String?> value) {
    _$exportEmployeesFutureAtom.reportWrite(value, super.exportEmployeesFuture,
        () {
      super.exportEmployeesFuture = value;
    });
  }

  late final _$employeeListAtom =
      Atom(name: '_EmployeeStore.employeeList', context: context);

  @override
  EmployeeList? get employeeList {
    _$employeeListAtom.reportRead();
    return super.employeeList;
  }

  @override
  set employeeList(EmployeeList? value) {
    _$employeeListAtom.reportWrite(value, super.employeeList, () {
      super.employeeList = value;
    });
  }

  late final _$getEmployeesAsyncAction =
      AsyncAction('_EmployeeStore.getEmployees', context: context);

  @override
  Future<dynamic> getEmployees() {
    return _$getEmployeesAsyncAction.run(() => super.getEmployees());
  }

  late final _$updateEmployeesAsyncAction =
      AsyncAction('_EmployeeStore.updateEmployees', context: context);

  @override
  Future<dynamic> updateEmployees(UpdateEmployeeParams params) {
    return _$updateEmployeesAsyncAction
        .run(() => super.updateEmployees(params));
  }

  late final _$exportEmployeesAsyncAction =
      AsyncAction('_EmployeeStore.exportEmployees', context: context);

  @override
  Future<dynamic> exportEmployees() {
    return _$exportEmployeesAsyncAction.run(() => super.exportEmployees());
  }

  @override
  String toString() {
    return '''
fetchEmployeesFuture: ${fetchEmployeesFuture},
updateEmployeesFuture: ${updateEmployeesFuture},
exportEmployeesFuture: ${exportEmployeesFuture},
employeeList: ${employeeList},
loading: ${loading},
loadingUpdate: ${loadingUpdate},
loadingExport: ${loadingExport}
    ''';
  }
}
