import 'dart:async';

import 'package:app/core/data/network/dio/dio_client.dart';
import 'package:app/data/network/constants/endpoints.dart';
import 'package:app/domain/entity/employee/employee.dart';
import 'package:app/domain/entity/employee/employee_list.dart';
import 'package:app/domain/usecase/employee/update_employee_usecase.dart';
import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';

class EmployeeApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  EmployeeApi(this._dioClient);

  /// Returns list of post in response
  Future<EmployeeList> getEmployees() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getEmployees);
      return EmployeeList.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Employee> updateEmployee(UpdateEmployeeParams employee) async {
    try {
      final res = await _dioClient.dio.patch(
          "${Endpoints.pathEmployee}/${employee.manpowerId}",
          data: employee.toJson());
      return Employee.fromMap(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<String?> exportCSV() async {
    try {
      final now = DateTime.now();
      final fileName = now.toString().replaceAll(RegExp(r'[^\d\-:\.]'), '');
      final options = Options(
        responseType: ResponseType.bytes,
      );
      final response =
          await _dioClient.dio.get(Endpoints.exportEmployee, options: options);

      String path = await FileSaver.instance.saveFile(
        name: "employees_$fileName",
        bytes: response.data,
        ext: 'csv',
        mimeType: MimeType.csv,
      );
      return path;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
