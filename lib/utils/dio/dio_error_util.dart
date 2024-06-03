import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:-----------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.unknown:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription = "${error.response?.data['detail']}";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Incorrect certificate";
        break;
    }
    return errorDescription;
  }
}
